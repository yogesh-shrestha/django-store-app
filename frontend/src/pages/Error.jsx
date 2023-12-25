import { useRouteError } from "react-router-dom";
import { Box, Typography, Container } from "@mui/material";
import NavigationBar from "../components/NavigationBar";


function Error() {
    const error = useRouteError();
    
    let title = 'An error occured!';
    let message = 'Something went wrong!'

    if (error.status === 404) {
        title = 'Not Found!';
        message = 'Could not find the resource!';
    }

    return (
        <>
            <NavigationBar />
            <Container sx={{ py: 8 }} maxWidth="lg">
                <Box minHeight="82vh" sx={{mt:5}}>
                    <Typography variant="h5" component="h3">{title}</Typography>  
                    <p>{message}</p>         
                </Box>
            </Container>
        </> 
        
     );
}

export default Error;