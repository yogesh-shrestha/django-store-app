import { getAuthToken } from "./auth"
import { json } from "react-router-dom"

export async function placeOrder(cartId) {
    const url = 'http://localhost:8000/store/orders/' 
    const token = getAuthToken()
    const auth_header = token ? 'JWT ' + token : null
    const orderResponse = await fetch(url, {
        method: 'POST',
        headers : {
            'Content-Type': 'application/json',
            'Authorization': auth_header
        },
        body: JSON.stringify({cart_id: cartId})
    })

    if (orderResponse.status === 200 || orderResponse.status === 401) {
        return orderResponse
    }

    if (!orderResponse.ok) {
        throw json(
            {message: "Something went wrong, Could not place your order!, Try again."},
            {status: orderResponse.status}
        )
    }           
}