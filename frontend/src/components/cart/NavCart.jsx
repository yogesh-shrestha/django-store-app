import { useContext } from "react";
import { NavLink } from "react-router-dom";
import { Button, Badge } from "@mui/material";
import AddShoppingCartIcon from "@mui/icons-material/AddShoppingCart";
import { CartContext } from "../../contexts/CartContext";


function NavCart() {
    const cartCtx = useContext(CartContext) 
  
    return (
        <Button 
            align="right" 
            component={NavLink} 
            to="/cartitems"
        >
            <Badge badgeContent={cartCtx.itemState.count} color="error">
                <AddShoppingCartIcon sx={{ color: "white" }} />
            </Badge>
        </Button>
    );
}

export default NavCart;
