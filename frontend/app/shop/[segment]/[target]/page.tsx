import { redirect } from "next/navigation";

type MalformedRoutePageProps = {
  params: Promise<{
    segment: string;
    target: string;
  }>;
};

export default async function MalformedRoutePage({ params }: MalformedRoutePageProps) {
  const resolvedParams = await params;
  const target = resolvedParams.target.toLowerCase();

  if (target === "customers") {
    redirect("/shop/orders");
  }

  if (target === "products" || target === "orders" || target === "cart") {
    redirect(`/shop/${target}`);
  }

  redirect("/shop");
}