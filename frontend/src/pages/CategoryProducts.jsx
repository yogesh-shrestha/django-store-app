import { Grid, Box } from "@mui/material";
import ProductCard from "../components/ProductCard";
import { useLoaderData, json } from "react-router-dom";
import { getAuthToken } from '../utils/auth';


export default function CategoryProducts() {
    const products = useLoaderData();

    return ( 
        <Box minHeight="82vh">
        <Grid container spacing={4}>
            {products.map(product => (
            <Grid item xs={12} sm={6} md={3} key={product.id}>
                <ProductCard 
                    id={product.id} 
                    title={product.title} 
                    image_url={product.images[0]['image']}
                    price={product.price}/>
            </Grid>
            ))}
        </Grid>
        </Box>
    
     );
}


export async function categoryProductsLoader({params}) {
    const { catId } = params
    const url = 'http://127.0.0.1:8000/store/categories/' + catId +'/products/'
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