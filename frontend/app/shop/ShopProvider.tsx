"use client";

import { ProductType } from "../types/ProductType";
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
} from "react";

type CartItem = ProductType & { cartQuantity: number };

type ShopContextType = {
  cartItems: CartItem[];
  selectedCustomerId: string;
  setSelectedCustomerId: (value: string) => void;
  addToCart: (product: ProductType) => void;
  removeFromCart: (productId: string) => void;
  updateCartQuantity: (productId: string, quantity: number) => void;
  clearCart: () => void;
  cartCount: number;
  cartTotal: number;
};

const ShopContext = createContext<ShopContextType | null>(null);

const CART_STORAGE_KEY = "shop-cart-items";
const CUSTOMER_STORAGE_KEY = "shop-selected-customer";

export function ShopProvider({ children }: { children: React.ReactNode }) {
  const [cartItems, setCartItems] = useState<CartItem[]>([]);
  const [selectedCustomerId, setSelectedCustomerId] = useState<string>("");

  useEffect(() => {
    const storedCart = localStorage.getItem(CART_STORAGE_KEY);
    const storedCustomer = localStorage.getItem(CUSTOMER_STORAGE_KEY);

    if (storedCart) {
      try {
        const parsed = JSON.parse(storedCart) as CartItem[];
        setCartItems(Array.isArray(parsed) ? parsed : []);
      } catch {
        setCartItems([]);
      }
    }

    if (storedCustomer) {
      setSelectedCustomerId(storedCustomer);
    }
  }, []);

  useEffect(() => {
    localStorage.setItem(CART_STORAGE_KEY, JSON.stringify(cartItems));
  }, [cartItems]);

  useEffect(() => {
    localStorage.setItem(CUSTOMER_STORAGE_KEY, selectedCustomerId);
  }, [selectedCustomerId]);

  const addToCart = useCallback((product: ProductType) => {
    setCartItems((prev) => {
      const existingItem = prev.find((item) => item.id === product.id);

      if (existingItem) {
        return prev.map((item) =>
          item.id === product.id
            ? {
                ...item,
                cartQuantity: Math.min(item.cartQuantity + 1, item.quantity),
              }
            : item
        );
      }

      return [...prev, { ...product, cartQuantity: 1 }];
    });
  }, []);

  const removeFromCart = useCallback((productId: string) => {
    setCartItems((prev) => prev.filter((item) => item.id !== productId));
  }, []);

  const updateCartQuantity = useCallback((productId: string, quantity: number) => {
    setCartItems((prev) =>
      prev
        .map((item) => {
          if (item.id !== productId) {
            return item;
          }

          return {
            ...item,
            cartQuantity: Math.max(1, Math.min(quantity, item.quantity)),
          };
        })
        .filter((item) => item.cartQuantity > 0)
    );
  }, []);

  const clearCart = useCallback(() => {
    setCartItems([]);
  }, []);

  const cartCount = useMemo(
    () => cartItems.reduce((sum, item) => sum + item.cartQuantity, 0),
    [cartItems]
  );

  const cartTotal = useMemo(
    () =>
      cartItems.reduce(
        (sum, item) => sum + Number(item.unitCost || 0) * item.cartQuantity,
        0
      ),
    [cartItems]
  );

  const value: ShopContextType = {
    cartItems,
    selectedCustomerId,
    setSelectedCustomerId,
    addToCart,
    removeFromCart,
    updateCartQuantity,
    clearCart,
    cartCount,
    cartTotal,
  };

  return <ShopContext.Provider value={value}>{children}</ShopContext.Provider>;
}

export function useShop() {
  const context = useContext(ShopContext);
  if (!context) {
    throw new Error("useShop must be used within ShopProvider");
  }

  return context;
}
