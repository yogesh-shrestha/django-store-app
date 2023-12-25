import { getAuthToken } from "../utils/auth";
import { useLoaderData, json } from "react-router-dom";
import { Grid, Divider, Box } from "@mui/material";

function Profile() {
    const data = useLoaderData();
    const profile = data[0];
    const orders = data[1]

    return ( 
        <Grid minHeight="80vh">
            <h1>{profile.first_name} {profile.last_name}</h1>
            <h2>Membership: { profile.membership === "P" ?  "Premium" : "Normal"} </h2>
            {profile.birth_date && <h2>Membership: { profile.birth_date } </h2>}

            {
                orders.map(order => (
                    <Grid key={order.id}>
                        <Divider />
                        <h4>Order placed on: {order.placed_on} </h4>
                        <Divider />
                        {order.orderitems.map(orderitem => (
                            <Box key={orderitem.product.id} sx={{pl: 10}}>
                                <h5>
                                    {orderitem.product.title}
                                </h5>
                            </Box>
                            
                        ))}
                        <Divider />
                    </Grid>
                    
                ))
            }
        </Grid>
     );
}

export default Profile;

export async function profileLoader() {
    const url = 'http://localhost:8000/store/customers/me/' 
    const token = getAuthToken()
    const auth_header = token ? 'JWT ' + token : null
    const responseProfile = await fetch(url, {
        method: 'GET',
        headers : {
            'Content-Type': 'application/json',
            'Authorization': auth_header
        },
    })

    const responseOrder = await fetch('http://localhost:8000/store/orders/', {
        method: 'GET',
        headers : {
            'Content-Type': 'application/json',
            'Authorization': auth_header
        },
    })

    if (!responseProfile.ok) {

        throw json(
            {message: "Could not fetch profile data!"},
            {status: responseProfile.status}
        )
    }

    if (!responseOrder.ok) {

        throw json(
            {message: "Could not fetch order data!"},
            {status: responseOrder.status}
        )    
    } 

    return Promise.all([responseProfile.json(), responseOrder.json()])
}