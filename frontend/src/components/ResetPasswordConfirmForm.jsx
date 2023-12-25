import { 
    Grid, 
    Paper, 
    Avatar, 
    Typography, 
    TextField,
    Button,
    Alert,
    CircularProgress
} from "@mui/material";
import ChangeCircleIcon from '@mui/icons-material/ChangeCircle';
import { Form } from "react-router-dom";


function ResetPasswordConfirmForm({actionData, isSubmitting}) {
    return ( 
        <Grid height="80vh">
            <Paper 
                elevation={10} 
                sx={{p:2, height: '40vh', width: 500, ml: 'auto', mr: 'auto' }}
            >
                    
                <Grid align="center" sx={{mb: 5}}>
                    <Avatar sx={{bgcolor: '#03a9f4'}}><ChangeCircleIcon /></Avatar>
                    <Typography variant="h5" component="h5">Reset Password</Typography>
                </Grid> 

                <Form method='post'>

                    <Grid align="center" sx={{mb: 5}}>
                    {isSubmitting && <CircularProgress />}
                    </Grid> 

                    {actionData && Object.entries(actionData).map((entry) => (
                       <Alert severity="error" key={entry[0]}>{`${entry[0]}: ${entry[1]}`}</Alert>
                        
                    ))}

                    <TextField 
                        label='New Password' 
                        name="password" 
                        type="password"
                        size="small" 
                        fullWidth 
                        required 
                        sx={{mb:2, mt:2}}>                      
                    </TextField>

                    <TextField 
                        label='Confirm New Password' 
                        name="repassword" 
                        type="password"
                        size="small" 
                        fullWidth 
                        required 
                        sx={{mb:2}}>                      
                    </TextField>

                    <Button 
                        type='submit' 
                        fullWidth 
                        variant="contained"
                        sx={{bgcolor: '#03a9f4', mt:3, mb:3}}>
                            Reset Password
                    </Button>

                </Form>

            </Paper>
        </Grid>
     );
}

export default ResetPasswordConfirmForm;