import { 
    AppBar, 
    Container, 
    Toolbar ,
    Typography,
    Button,
    Box,
} from '@mui/material';
import { NavLink, Link, useNavigate, useRouteLoaderData } from 'react-router-dom';
import NavCart from './cart/NavCart';


function NavigationBar() {

    const categories = [
        {'name': 'Clothes', 'id': 1}, 
        {'name': 'Jewellery', 'id': 6}, 
        {'name': 'Shoes', 'id': 4}, 
        {'name': 'electronics', 'id': 2}, 
        {'name': 'Furniture', 'id': 3}, 
    ]
    const navigate = useNavigate();
    let token = useRouteLoaderData('root');

    function onClickLogoutHandler() {
        localStorage.removeItem('demoShopAccesstoken');
        localStorage.removeItem('demoShopRefreshtoken');
        localStorage.removeItem('demoShopExpirationDate');
        token=null;
        navigate('/');
    }

    function onClickChangePwdHandler() {
        navigate('/accounts/set-password')
    }

    return ( 
        <AppBar position='static' sx={{bgcolor: '#03a9f4'}}>
            <Container maxWidth='xl'>
                <Toolbar disableGutters>
                <Box sx={{ display: { md: 'flex' } }} >
                    <Typography
                        variant="h5"
                        noWrap
                        component={Link}
                        to="/"
                        sx={{
                            mr: 2,
                            mt:2,
                            display: {md: 'flex' },
                            fontFamily: 'monospace',
                            fontWeight: 700,
                            letterSpacing: '.2rem',
                            color: 'white',
                            textDecoration: 'none',
                        }}
                    >
                     DemoShop
                     </Typography>

                                
                    {categories.map((category) => (
                    <Button
                        key={category.id}
                        component={NavLink}
                        to={`/categories/${category.id}/products`}
                        style={({isActive}) => { return {backgroundColor: isActive ? '#0288d1' : ''}}}
                        sx={{ my: 2, ml:1, color: 'white', display: 'block', fontWeight: 'bold'}}
                    >
                        {category.name}
                    </Button>

                    ))}

                    {!token && <Button
                        component={NavLink}
                        to="/accounts/sign-up"
                        style={({isActive}) => { return {backgroundColor: isActive ? '#0288d1' : ''}}}
                        sx={{ my: 2, ml:1, color: 'white', display: 'block', fontWeight: 'bold'}}
                    >
                    Sign Up
                    </Button>}                          
                    
                    {!token && <Button
                        component={NavLink}
                        to="/accounts/sign-in"
                        style={({isActive}) => { return {backgroundColor: isActive ? '#0288d1' : ''}}}
                        sx={{ my: 2, ml:1, color: 'white', display: 'block', fontWeight: 'bold'}}
                    >
                    Sign In
                    </Button>}
                    
                    {token && <Button
                            component={NavLink}
                            to="/accounts/set-password"
                            onClick={onClickChangePwdHandler}
                            sx={{ my: 2, ml:1, color: 'white', display: 'block', fontWeight: 'bold'}}
                        >
                            Change Password
                        </Button>} 

                    {token && <Button
                            component={NavLink}
                            to="/accounts/me"
                            style={({isActive}) => { return {backgroundColor: isActive ? '#0288d1' : ''}}}
                            sx={{ my: 2, ml:1, color: 'white', display: 'block', fontWeight: 'bold'}}
                        >
                            Profile
                        </Button>} 

                    {token && <Button
                            component={NavLink}
                            to="/"
                            onClick={onClickLogoutHandler}
                            style={({isActive}) => { return {backgroundColor: isActive ? '#0288d1' : ''}}}
                            sx={{ my: 2, ml:1, color: 'white', display: 'block', fontWeight: 'bold'}}
                        >
                            Logout
                        </Button>}  

                    <NavCart />
                  
                </Box>
                </Toolbar>
            </Container>
        </AppBar>
     );
}

export default NavigationBar;