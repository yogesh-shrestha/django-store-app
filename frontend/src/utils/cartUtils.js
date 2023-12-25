import { json } from "react-router-dom";

export async function createCart(productId, quantity) {
    const response = await fetch('http://localhost:8000/store/carts/', {
        method: 'POST'
    })
    if (response.status === 201) {
        const emptyCart = await response.json();
        localStorage.setItem('demoShopCartId', emptyCart.id)
        await addItemToCart(emptyCart.id, productId, quantity)
    }
    if (!response.ok) {
        throw json(
            {message: "could not add the product to cart."},
            {status: response.status}
        )
    }
}


export async function addItemToCart(cart_id, productId, quantity) {
    const url = 'http://localhost:8000/store/carts/' + cart_id + '/items/'
    const cartItemPostResponse = await fetch(url, {
        method: 'POST',
        headers : {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({product_id: productId,
                            quantity: quantity})
    })

    if (cartItemPostResponse.status === 201) {
        const cartItem = await cartItemPostResponse.json();
        return cartItem
    }

    if (!cartItemPostResponse.ok) {
        throw json(
            {message: "could not add the product to cart."},
            {status: cartItemPostResponse.status}
        )
    }           
}


export async function getCartItems(cartId) {  
    const url = 'http://localhost:8000/store/carts/' + cartId + '/items/'
    const response = await fetch(url, {
        method: 'GET',
        headers : {
            'Content-Type': 'application/json',
        },
    })
    if (response.status === 200) {
        const cartItems = await response.json()
        return cartItems
    }
    if (!response.ok) {
        throw json(
            {message: "could not add the product to cart."},
            {status: response.status}
        )
    }
}


export async function deleteCartItems(cartId, cartItemId) {  
    if (cartId) {
        const cartId = localStorage.getItem('demoShopCartId') 
        const url = 'http://localhost:8000/store/carts/' + cartId + '/items/' + cartItemId + '/'
        const response = await fetch(url, {
            method: 'DELETE',
            headers : {
                'Content-Type': 'application/json',
            },
        })

        if (!response.ok) {
            throw json(
                {message: "could not add the product to cart."},
                {status: response.status}
            )
        }
        return response
    }
}
