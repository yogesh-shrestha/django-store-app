
import { useLoaderData, json } from "react-router-dom";
import { 
    Grid, 
    Typography, 
    Box, 

} from "@mui/material";
import { getAuthToken } from "../utils/auth";
import AddItem from '../components/cart/AddItem';


export default function ProductDetail() {
    const product = useLoaderData();

    return ( 
        <Box minHeight="82vh">
        <Grid container spacing={4}>
            <Grid container item xs={12} md={7} sx={{justifyContent: "center", display: "flex"}}>
            <Box
                component="img"
                sx={{
                    maxHeight: '70%',
                    maxWidth: '70%',
                }}
                alt={product && product.title}
                src={product && product.images[0]['image']+'/'}
            />
            </Grid>
            <Grid item xs={12} md={5}>
                <Typography 
                    variant="h4" 
                    component="div"
                    sx={{mb:2}}
                >
                    {product.title}
                </Typography>
                <Typography 
                    variant="body-2" 
                    component="div"
                    sx={{mb:2}}
                >
                    {product.description}
                </Typography>
                <Typography variant="h4">€{product && product.price} <small>VAT included</small></Typography>              
                <AddItem productId={product.id}/>
            </Grid>
            
        </Grid>
        </Box>
     );
}


export const productDetailLoader = async ({request, params}) => {
    const { productId } = params
    const url = 'http://127.0.0.1:8000/store/products/' + productId + '/'
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