import json
import os
import functions_framework
from google.cloud import bigquery

PROJECT_ID = os.getenv("GCP_PROJECT_ID") or os.getenv("BQ_PROJECT") or ""
DATASET = "cloud_mastery"
TABLE = "table_parts_catalog"
MAX_RESULTS = 5
GCS_PUBLIC_BASE = "https://storage.googleapis.com/cloud_mastery_images/"

# Generic terms customers type that don't correspond to any stored value —
# stripped out so they never block a match against real columns.
STOPWORDS = {"battery", "batteries", "part", "parts", "for", "a", "an", "the"}

_client = bigquery.Client(project=PROJECT_ID)


def _resolve_image_url(image_uri: str) -> str:
    if not image_uri:
        return ""
    if image_uri.startswith("gs://"):
        return image_uri.replace("gs://", GCS_PUBLIC_BASE, 1)
    return image_uri


def _search_parts(query: str, max_results: int = MAX_RESULTS) -> dict:
    terms = [t for t in query.strip().lower().split() if t not in STOPWORDS]

    if not terms:
        return {"found": False, "products": []}

    conditions = []
    params = []
    for i, term in enumerate(terms):
        conditions.append(f"""(
            LOWER(make) LIKE @term_{i}
            OR LOWER(model) LIKE @term_{i}
            OR LOWER(brand) LIKE @term_{i}
            OR LOWER(batteryType) LIKE @term_{i}
            OR LOWER(sku) LIKE @term_{i}
        )""")
        params.append(bigquery.ScalarQueryParameter(f"term_{i}", "STRING", f"%{term}%"))

    sql = f"""
        SELECT
            id             AS product_id,
            sku            AS sku,
            make           AS make,
            model          AS model,
            yearFrom       AS year_from,
            yearTo         AS year_to,
            batteryType    AS battery_type,
            voltage        AS voltage,
            capacityAh     AS capacity_ah,
            cca            AS cca,
            brand          AS brand,
            priceKes       AS price,
            stock          AS stock,
            branchLocation AS branch_location,
            image_url      AS image_url
        FROM `{PROJECT_ID}.{DATASET}.{TABLE}`
        WHERE {" AND ".join(conditions)}
        LIMIT @max_results
    """
    params.append(bigquery.ScalarQueryParameter("max_results", "INT64", max_results))
    job_config = bigquery.QueryJobConfig(query_parameters=params)

    rows = list(_client.query(sql, job_config=job_config).result())

    if not rows:
        return {"found": False, "products": []}

    products = []
    for row in rows:
        image_url = _resolve_image_url(row.image_url)
        fitment = f"{row.make} {row.model} ({row.year_from}-{row.year_to})"
        specs = f"{row.battery_type}, {row.voltage}V, {row.capacity_ah}Ah, {row.cca}CCA"
        subtitle = f"{fitment} — {specs}"
        if row.stock is not None and row.stock <= 0:
            subtitle = f"{subtitle} (Out of stock)"
        elif row.branch_location:
            subtitle = f"{subtitle} — {row.branch_location}"

        products.append({
            "productId": row.product_id,
            "title": f"{row.brand} {row.battery_type} Battery" if row.brand else row.sku,
            "subtitle": subtitle,
            "price": f"KES {row.price:,.2f}" if row.price is not None else "",
            "imageUris": [image_url] if image_url else [],
            "uri": "",
        })

    return {"found": True, "products": products}


@functions_framework.http
def search_parts(request):
    request_json = request.get_json(silent=True) or {}
    query = request_json.get("query", "")
    max_results = request_json.get("max_results", MAX_RESULTS)

    if not query:
        return (json.dumps({"error": "Missing required field 'query'"}), 400,
                {"Content-Type": "application/json"})

    result = _search_parts(query, max_results)
    return (json.dumps(result), 200, {"Content-Type": "application/json"})