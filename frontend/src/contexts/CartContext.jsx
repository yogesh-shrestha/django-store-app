import { createContext } from "react";

export const CartContext = createContext({
    itemState: {count:0},
    onAddItem: () => {},
    onDeleteItem: () => {},
    onResetCount: () => {},
  });