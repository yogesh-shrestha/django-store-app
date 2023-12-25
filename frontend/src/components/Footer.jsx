import { Box } from '@mui/material';
import Copyright from './Copyright'

function Footer() {
    return ( 
        <Box sx={{ bgcolor: '#03a9f4', 
                p: 2, 
                position: 'absloute',

                left:0,
                bottom:0,
                right:0,
                }} 
                component="footer">

            <Copyright />
        </Box>
     );
}

export default Footer;