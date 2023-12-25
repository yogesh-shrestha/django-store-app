import { 
    useActionData, 
    json, 
    useNavigation, 
    redirect,
} 
from "react-router-dom";
import ResetPasswordForm from "../components/ResetPasswordForm";

function ResetPassword() {
    const actionData = useActionData();
    const navigation = useNavigation();

    const isSubmitting = navigation.state === 'submitting'

    return ( 
        <ResetPasswordForm 
            actionData={actionData}
            isSubmitting={isSubmitting}
        />
     );
}

export default ResetPassword;

export async function resetPasswordAction({request, params}) {
    const data = await request.formData();
    const emailData = {
        email: data.get('email')
    }

    const url = 'http://127.0.0.1:8000/auth/users/reset_password/'

    const response = await fetch(url, {
        method: 'POST',
        headers : {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(emailData)
    })

    if (response.status === 204) {
        alert('A reset link has been sent to your email, click the link and reset your password.')
        return redirect('/')
    }

    if (response.status === 400) {
        return response
    }

    if (!response.ok) {

        throw json(
            {message: "Could not reset password!"},
            {status: response.status}
        )
    }
}