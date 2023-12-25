import { Typography, Link } from "@mui/material";

function Copyright() {
    return ( 
        <Typography variant="body2" color="text.secondary" align="center">
            {'Copyright © '}
            <Link color="inherit" href="#">
                Demodhop
            </Link>{' '}
            {new Date().getFullYear()}
            {'.'}
        </Typography>
     );
}

export default Copyright;