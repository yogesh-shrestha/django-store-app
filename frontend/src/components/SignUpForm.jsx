import { Grid, 
    Paper, 
    Avatar, 
    Typography, 
    TextField,
    Button,
    Stack,
    CircularProgress,
    Alert
} from "@mui/material";
import PersonAddAltIcon from '@mui/icons-material/PersonAddAlt';
import { Form } from "react-router-dom";

function SignUpForm({isSubmitting, actionData}) {
    
    return ( 
        <Grid height="80vh">
            <Paper 
                elevation={10} 
                sx={{p:2, height: 'auto', width: 500, ml: 'auto', mr: 'auto' }}
            >
                <Grid align="center" sx={{mb: 5}}>
                    <Avatar sx={{bgcolor: '#03a9f4'}}><PersonAddAltIcon /></Avatar>
                    <Typography variant="h5" component="h5">Sign Up</Typography>
                </Grid> 

            <Form method='post'>

            <Grid align="center" sx={{mb: 3}}>
                {isSubmitting && <CircularProgress />}
                {actionData && Object.entries(actionData).map((entry) => (
                <Alert severity="error" key={entry[0]}>{`${entry[0]}: ${entry[1]}`}</Alert>               
            ))}
            </Grid> 

                <TextField 
                        label='Username' 
                        name='username'
                        size="small" 
                        fullWidth 
                        required 
                        maxLength={255}
                        sx={{mb:2}}>                      
                    </TextField>

                    <TextField 
                        label='Email' 
                        name='email'
                        type="email" 
                        size="small" 
                        fullWidth 
                        required 
                        maxLength={255}
                        sx={{mb:2}}>                        
                    </TextField>

                    <TextField 
                        label='First Name' 
                        name='firstname'
                        size="small" 
                        fullWidth 
                        required 
                        maxLength={255}
                        sx={{mb:2}}>                       
                    </TextField>

                    <TextField 
                        label='Last Name' 
                        name='lastname'
                        size="small" 
                        fullWidth 
                        required 
                        maxLength={255}
                        sx={{mb:2}}>                       
                    </TextField>

                    <TextField 
                        label='Password' 
                        name='password'
                        type="password" 
                        size="small" 
                        fullWidth 
                        required 
                        maxLength={255}
                        sx={{mb:2}}>                       
                    </TextField>

                    <TextField 
                        label='Confirm Password' 
                        name='repassword'
                        type="password" 
                        size="small" 
                        fullWidth 
                        required 
                        maxLength={255}
                        sx={{mb:2}}>                                          
                    </TextField>   

                    {/* {!passwordMatched && <Alert severity="error">
                        Password & Confirm Password don't match!</Alert>}                     */}

                    {/* <FormControlLabel
                        label="I agree to Terms and Conditions."
                        control={
                            <Checkbox
                                name="checkedTOC"
                                // onClick={onCheckHandler}
                                sx={{color: '#03a9f4'}}
                            />
                        }
                    />
                    {!tocChecked && <Alert severity="error">
                        You must agree on Terms & Conditions!</Alert>} */}
                    
                    <Stack direction='row' spacing={3} sx={{mt: 2}}>
                        <Button 
                            type='reset' 
                            variant="contained"
                            disabled={isSubmitting}
                            sx={{bgcolor: '#03a9f4', mt:3, mb:3}}>
                                Reset
                        </Button>
                        <Button 
                            type='submit' 
                            variant="contained"
                            disabled={isSubmitting}
                            sx={{bgcolor: '#03a9f4', mt:3, mb:3}}>
                                Sign In
                        </Button>
                        
                    </Stack>
                </Form>

            </Paper>
        </Grid>
     );
}

export default SignUpForm;