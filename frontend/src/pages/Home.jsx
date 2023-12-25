import { Grid, CircularProgress } from "@mui/material";
import ProductCard from "../components/ProductCard";
import { useLoaderData, useNavigation, json } from "react-router-dom";
import { getAuthToken } from '../utils/auth';

function Home() {
    const products = useLoaderData();
    const navigation = useNavigation();

    return ( 
        <Grid container spacing={4}>
            {products.map(product => (              
            <Grid item xs={12} sm={6} md={3} key={product.id}>
                {navigation.state === 'loading' && <CircularProgress />}
                <ProductCard 
                    id={product.id} 
                    title={product.title} 
                    image_url={product.images[0]['image']}
                    price={product.price}/>
            </Grid>
            ))}
        </Grid>
    
     );
}
export default Home;


export async function productsLoader() {
    const url = 'http://127.0.0.1:8000/store/products/'
    const token = getAuthToken()
    const auth_header = token ? 'JWT ' + token : null
    const response = await fetch(url, {
        method: 'GET',
        headers : {
            'Content-Type': 'application/json',
            'Authorization': auth_header
        },
    })

    if (!response.ok) {

        throw json(
            {message: "Could not fetch data!"},
            {status: response.status}
        )
        
    } else {
        return response
    }
}