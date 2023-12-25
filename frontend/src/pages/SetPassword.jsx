import { Grid } from "@mui/material";
import SetPasswordForm from "../components/SetPasswordForm";
import { 
    useActionData, 
    useNavigation, 
    json, 
    redirect, 
    useRouteLoaderData, 
} from "react-router-dom";
import { getAuthToken } from "../utils/auth";

function SetPassword() {
    const actionData = useActionData();
    const navigation = useNavigation();
    const token = useRouteLoaderData('root');

    const submitting = navigation.state === 'submitting'

    return ( 
        <>
            {token 
            ?  (<SetPasswordForm 
                actionData={actionData}
                submitting={submitting}
                />)
            :  (<Grid height="80vh">
                <h4>You must be logged in to access this page.</h4>
                </Grid>)
            }
        </>
     );
}

export default SetPassword;


export async function setPasswordAction({request}) {
    const data = await request.formData();
    const setPwdData = {
        current_password: data.get('oldpassword'),
        new_password: data.get('password'),
        re_new_password: data.get('repassword')
    }

    const url = 'http://127.0.0.1:8000/auth/users/set_password/'
    const token = getAuthToken()
    const auth_header = token ? 'JWT ' + token : null
    const response = await fetch(url, {
        method: 'POST',
        headers : {
            'Content-Type': 'application/json',
            'Authorization': auth_header
        },
        body: JSON.stringify(setPwdData)
    })

    if (response.status === 204) {
        alert("Your password has been successfully changed.")
        return redirect('/')
    }

    if (response.status === 400) {
        return response
    }

    if (!response.ok) {

        throw json(
            {message: "Could not change password!"},
            {status: response.status}
        )
    }
}