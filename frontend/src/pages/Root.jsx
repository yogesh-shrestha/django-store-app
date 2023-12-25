import { useEffect, useReducer } from 'react';
import { Outlet, useLoaderData } from 'react-router-dom';
import { Container } from '@mui/material';
import NavigationBar from "../components/NavigationBar";
import Footer from '../components/Footer';
import { CartContext } from '../contexts/CartContext';
import { createCart, addItemToCart, getCartItems } from '../utils/cartUtils';


//======= context==========
let initalState = {count: 0};
function itemReducer(itemState, action) {
    switch(action.type){
        case 'addItems':
            const productId = action.addEvent.target.getAttribute('data-productid')
            const quantity = Number(action.addEvent.target.getAttribute('data-qty'))
            const cartId = localStorage.getItem('demoShopCartId')
            if (!cartId) {
                createCart(productId, quantity) 
                itemState.count = itemState.count + quantity
            } else {
                addItemToCart(cartId, productId, quantity)  
                itemState.count = itemState.count + quantity
            } 
            return {...itemState}

        case 'deleteItems':
            itemState.count = itemState.count - action.quantity
            return {...itemState}

        case 'resetCount':
            itemState.count = 0
            return {...itemState}
    }
}


//====== loading initial state of cartContext
const cartId = localStorage.getItem('demoShopCartId')
if (cartId) {
    getCartItems(cartId).then(result => {
        result.map(item => {initalState.count += item.quantity})
    })
}


function RootLayout() {
    const token = useLoaderData();

    //== loading token===========
    useEffect(() => {
        if (!token) {
            return;
        }

    }, [])


    //==== context===========
    const [countState, dispatchItem] = useReducer(itemReducer, initalState)
    function handleAddItem(event) {
        dispatchItem({
            type: 'addItems',
            addEvent: event
        })
    }
    function handleDeleteItem(quantity) {
        dispatchItem({
            type: 'deleteItems',
            quantity: quantity
        })
    }
    function handleReset() {
        dispatchItem({
            type: 'resetCount'
        })
    }

    const itemCtx = {
        itemState: countState,
        onAddItem: handleAddItem,
        onDeleteItem: handleDeleteItem,
        onResetCount: handleReset,
    }


    return ( 
        <CartContext.Provider value={itemCtx}>
            <NavigationBar />
            <Container sx={{ py: 8 }} maxWidth="lg">
                    <Outlet />
            </Container>
            <Footer />
        </CartContext.Provider>
     );
}

export default RootLayout;