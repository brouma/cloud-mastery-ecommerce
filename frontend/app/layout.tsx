import "./globals.css";

export const metadata = {
  title: "Hazel Market",
  description: "Standalone storefront application",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
