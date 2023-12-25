import { Button, Stack, IconButton } from "@mui/material";
import RemoveIcon from '@mui/icons-material/Remove';
import AddIcon from '@mui/icons-material/Add';
import { useContext, useState } from "react";
import { CartContext } from "../../contexts/CartContext";


function AddItem({ productId }) {
    const cartCtx = useContext(CartContext)
    const [qty, setQty] = useState(1)

    function onAddHandler() {
        setQty(qty => qty + 1)
    }

    function onRemoveHandler() {
        if (qty > 1) setQty(qty => qty - 1)
    }


    return (
        <Stack direction="row" spacing={4}>
            <Stack direction="row" spacing={1}>
                <IconButton onClick={onRemoveHandler}><RemoveIcon /></IconButton>
                <Button variant="outlined">{qty}</Button>
                <IconButton onClick={onAddHandler}><AddIcon /></IconButton>
            </Stack>
                <Button
                    variant="contained"
                    size="small"
                    sx={{ bgcolor: "#03a9f4" }}
                    data-productid={productId}
                    data-qty={qty}
                    onClick={cartCtx.onAddItem} 
                >
                    ADD TO CART
                </Button>
        </Stack>

        
    );
}

export default AddItem;
