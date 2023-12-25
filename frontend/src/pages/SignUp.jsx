import SignUpForm from '../components/SignUpForm'
import { json, useNavigation, useActionData, redirect } from 'react-router-dom';


function SignUp() {

    const navigation = useNavigation();
    const actionData = useActionData();
    
    const isSubmitting = navigation.state === 'submitting';

    return ( 
        <SignUpForm 
            isSubmitting={isSubmitting}
            actionData={actionData}
        />
     );
}

export default SignUp;


export async function actionSignUp({request, params}) {
    const data = await request.formData()

    const signUpData = {
        username: data.get('username'),
        email: data.get('email'),
        first_name: data.get('firstname'),
        last_name: data.get('lastname'),
        password: data.get('password'),
        re_password: data.get('repassword'),
    }
    
    const response = await fetch('http://localhost:8000/auth/users/', {
        method: 'POST',
        headers : {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(signUpData)
    })

    if (response.status===400) {
        return response
    }

    if (!response.ok) {
        throw json(
            {message: 'You could not be registered!'},
            {status: response.status}
        )
    }

    alert("An activation link has been sent to your email, click the link and follow the instruction to activate your account.")
    return redirect('/')
}