import PasswordResetConfirmForm from "../components/ResetPasswordConfirmForm";
import { useActionData, useNavigation, redirect, json } from "react-router-dom";

function ResetPasswordConfirm() {
    const actionData = useActionData();
    const navigation = useNavigation();

    const isSubmitting = navigation.state === 'submitting'

    return ( 
        <PasswordResetConfirmForm 
            actionData={actionData}
            isSubmitting={isSubmitting}

        />
     );
}

export default ResetPasswordConfirm;


export async function resetPasswordConfirmAction({request, params}) {
    const {uid, token} = params;
    const data = await request.formData();
    const resetData = {
        uid: uid,
        token: token,
        new_password: data.get('password'),
        re_new_password: data.get('repassword')
    }

    const url = 'http://127.0.0.1:8000/auth/users/reset_password_confirm/'

    const response = await fetch(url, {
        method: 'POST',
        headers : {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(resetData)
    })

    if (response.status === 204) {
        alert("You password has been successfully reset.")
        return redirect('/accounts/sign-in')
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