import { Button, Grid, Paper, Typography } from "@mui/material"
import { redirect, json, Form } from "react-router-dom"



export default function Activate() {
    return (
        <Grid height="80vh">
            <Paper 
                elevation={10} 
                sx={{p:2, height: 'auto', width: 500, ml: 'auto', mr: 'auto' }}
            >
                    
                <Form method='post'>
                    <Typography component="h5">
                        Click the button below to activate your account.
                    </Typography>
                    <Button 
                        type='submit'  
                        variant="contained"
                        sx={{bgcolor: '#03a9f4', mt:3, mb:3}}>
                            Activate Account
                    </Button>
                </Form>
            </Paper>
        </Grid> 
    )
}

export const activateAction = async ({request, params}) => {
    const { uid, token } = params
    const activationKey = {
                            uid: uid,
                            token:token
                        }
    const url = 'http://127.0.0.1:8000/auth/users/activation/'
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(activationKey) 
    })

    if (response.status === 204) {
        alert('Congratulations, your account has been activated.')
        return redirect('/accounts/sign-in')
    }

    if (!response.ok) {
        throw json(
            {message: "Something went wrong. Your account could not be activated"},
            {status: response.status}
        )
        
    } 
    
} 



