import { useLoaderData, useNavigate } from "react-router-dom";
import { Grid, Paper, Stack, Button, Box, Alert } from "@mui/material";
import { getCartItems, deleteCartItems } from "../utils/cartUtils";
import { placeOrder } from "../utils/orderUtils";
import ClearIcon from '@mui/icons-material/Clear';
import { useState, useContext } from "react";
import { CartContext } from "../contexts/CartContext";

function CartItems() {
    const loadedItems = useLoaderData();
    const [cartItems, setCartItems] = useState(loadedItems);
    const [authorized, setAuthorized] = useState(true)
    const [orderSuccess, setOrderSuccess] = useState(false);
    const cartCtx = useContext(CartContext);
    const navigate = useNavigate()

    function deleteHandler(itemId, quantity) {
        const cartId = localStorage.getItem('demoShopCartId')
        deleteCartItems(cartId, itemId).then((response) => {
            if (response.status===204) {
                setCartItems(cartItems.filter(item => item.id !== itemId));
            }            
        })
        cartCtx.onDeleteItem(quantity);
    }

    function orderHandler() {
        const cartId = localStorage.getItem("demoShopCartId")
        placeOrder(cartId).then((response) => { 
            if (response.status === 401) {
                setAuthorized(false);
            } else {
                localStorage.removeItem("demoShopCartId") 
                setOrderSuccess(true)
                cartCtx.onResetCount();
                setTimeout(()=> { navigate('/') }, 2000)
            }          
        })      
    }

    return ( 
        <Grid minHeight="80vh">
            <Grid 
                elevation={10} 
                sx={{p:2, height: 'auto', width: 800, ml: 'auto', mr: 'auto' }}
            >

            {!authorized && <Alert severity="warning">You must be signed in to place an order!</Alert>}
            {loadedItems.msg && <Alert severity="info">No Cart available. Add product items to your cart.</Alert>}

            {cartItems.length > 0 && cartItems.map(item => 
            <Paper key={item.id} sx={{mt:2, bgcolor: '#03a9f4', color: '#fff'}} >  
                <Grid container  sx={{ml:2, pb: 2}}> 
                    <Grid item sm={10}>
                        <h3>{item.product.title}</h3>
                        <Grid item>
                            <Stack direction="row" spacing={3}>
                                <h4>Qty: {item.quantity}</h4>
                                <h4>Unit Price: € {item.product.price}</h4>
                                <h4>Total Price: € {item.total_price}</h4>                               
                            </Stack>
                        </Grid> 
                    </Grid>  
                    <Grid item sm={2} align='right'>
                        <Button data-itemid={item.id} 
                                    size="small" 
                                    sx={{color: "white", mr:2 }}
                                    onClick={() => {deleteHandler(item.id, item.quantity)}}
                        >
                            <ClearIcon data-itemid={item.id} sx={{color: '#fff'}} />
                        </Button>
                    </Grid> 
                </Grid>
            </Paper>            
            )}
           
            {cartItems.length > 0 && <Paper sx={{mt:2, bgcolor: '#03a9f4', color: '#fff'}} align="right">
                <Box sx={{pr: 2}}>
                <h2>Total Price: {parseFloat(cartItems.reduce((a, b) => 
                            ({total_price: a.total_price + b.total_price})).total_price).toFixed(2)} </h2>
                </Box>
            </Paper>
            } 

            {orderSuccess && <Alert severity="success" sx={{mb:2}}>Your order has been successfully placed!</Alert>}
            {cartItems.length > 0 &&
            <Button 
                variant="contained" 
                size="small" 
                onClick={orderHandler}
                color="success">Place Order</Button>
            }

            </Grid>
        </Grid>
     );
}

export default CartItems;

export async function cartItemsLoader() {
    const cartId = localStorage.getItem('demoShopCartId')
    if (cartId) {
        const cartItems = await getCartItems(cartId)
        return cartItems
    }
    else {
        return {msg: "No cart available!"}
    }
    
}