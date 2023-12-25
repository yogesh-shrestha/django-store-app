import { 
    Card, 
    CardMedia,
    CardContent,
    Typography,
    Box,
} from "@mui/material";

import { Link } from "react-router-dom";

function ProductCard({id, title, image_url, price}) {
    return (     

        <Card
            sx={{ height: '100%', display: 'flex', flexDirection: 'column' }}
        >
            <CardMedia
                component="img"
                sx={{pt: '5%', objectFit: "contain", height:200}}
                image={image_url}
            />
            <CardContent sx={{ flexGrow: 1 }}>
                <Typography 
                    gutterBottom 
                    variant="h6" 
                    component={Link} 
                    to={`/products/${id}`}
                    sx={{textDecoration: 'none', color:'#03a9f4'}}>
                    {title.length <= 28 ? title : title.substr(0,28)+"..."}
                    
                </Typography>
                <Box align="right" sx={{color: '#03a9f4'}}>
                    <Typography variant="h6">€ {price}</Typography>
                </Box>
                
            </CardContent>
        </Card>
       
     );
}

export default ProductCard;