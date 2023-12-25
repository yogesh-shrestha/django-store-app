import { Grid, 
    Paper, 
    Avatar, 
    Typography, 
    TextField,
    Button,
    Alert,
    CircularProgress,
} from "@mui/material";
import LockResetRoundedIcon from '@mui/icons-material/LockResetRounded';
import { Form } from "react-router-dom";


function ResetPasswordForm({actionData, isSubmitting}) {
    return ( 
        <Grid container height="80vh">
            <Paper 
                elevation={10} 
                sx={{p:2, height: 400, width: 500, ml: 'auto', mr: 'auto' }}
            >
                    
                <Grid align="center" sx={{mb: 5}}>
                    <Avatar sx={{bgcolor: '#03a9f4'}}><LockResetRoundedIcon /></Avatar>
                    <Typography variant="h5" component="h5" sx={{mb:2}}>Password Reset</Typography>
                    <Typography variant="body-2" component="p">
                        Enter your email associated with the account to reset your password.
                    </Typography>
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
                        name='email'
                        type="email"
                        size="small" 
                        fullWidth 
                        required 
                        sx={{mb:2, mt:2}}>                      
                    </TextField>

                    <Button 
                        type='submit' 
                        fullWidth 
                        variant="contained"
                        sx={{bgcolor: '#03a9f4', mt:3, mb:3}}>
                            Send Email
                    </Button>
                </Form>

            </Paper>
        </Grid>
     );
}

export default ResetPasswordForm;


