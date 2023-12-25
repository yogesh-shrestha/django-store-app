import { 
    Grid, 
    Paper, 
    Avatar, 
    Typography, 
    TextField,
    Checkbox,
    FormControlLabel,
    Button,
    Alert,
    CircularProgress
} from "@mui/material";
import LoginIcon from '@mui/icons-material/Login';
import { Link, Form } from "react-router-dom";



function SignIn({actionData, isSubmitting}) {
    return ( 
        <Grid minHeight="80vh">
            <Paper 
                elevation={10} 
                sx={{p:2, height: 'auto', width: 500, ml: 'auto', mr: 'auto' }}
            >
                    
                <Grid align="center" sx={{mb: 5}}>
                    <Avatar sx={{bgcolor: '#03a9f4'}}><LoginIcon /></Avatar>
                    <Typography variant="h5" component="h5">Sign In</Typography>
                </Grid> 

                <Form method='post'>
                    <Grid align="center" sx={{mb: 5}}>
                    {isSubmitting && <CircularProgress />}
                    </Grid> 

                    {actionData && Object.entries(actionData).map((entry) => (
                       <Alert severity="error" key={entry[0]}>{`${entry[0]}: ${entry[1]}`}</Alert>
                        
                    ))}
                    
                    <TextField 
                        label='Email' 
                        name="email"
                        type="email"
                        size="small" 
                        // required
                        fullWidth 
                        sx={{mb:1, mt:1}}>                      
                    </TextField>

                    <TextField 
                        label='Password' 
                        type="password" 
                        name="password"
                        // required
                        size="small" 
                        fullWidth 
                        sx={{mb:1, mt:1}}>                      
                    </TextField>

                    <FormControlLabel
                        label="Remember me"
                        control={
                            <Checkbox
                                name="checked"
                                sx={{color: '#03a9f4'}}
                            />
                        }
                    />

                    <Button 
                        type='submit' 
                        fullWidth 
                        variant="contained"
                        sx={{bgcolor: '#03a9f4', mt:3, mb:3}}>
                            Sign In
                    </Button>
                </Form>

                <Typography>
                    <Link to="/accounts/reset-password" style={{ textDecoration:'none' }}>Forgot Password?</Link>
                </Typography>

                <Typography>
                    Do you have an account?
                    <Link to="/accounts/sign-up" style={{ textDecoration:'none' }}> Sign up</Link>
                </Typography>

            </Paper>
        </Grid>
     );
}

export default SignIn;