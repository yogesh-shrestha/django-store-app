import SignInForm from '../components/SignInForm'
import { useNavigation, redirect, json, useActionData } from 'react-router-dom';

function SignIn() {
    const actionData = useActionData();
    const navigation = useNavigation();
    const isSubmitting = navigation.state === 'submitting';
    
    return ( 
        <SignInForm 
        actionData={actionData}
        isSubmitting={isSubmitting}
        />
     );
}

export default SignIn;


export async function actionSignIn({request, params}) {
    const data = await request.formData()

    const signUpData = {
        email: data.get('email'),
        password: data.get('password')
    }
    
    const response = await fetch('http://localhost:8000/auth/jwt/create/', {
        method: 'POST',
        headers : {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(signUpData)
    })

    if (response.status === 401 || response.status === 400) {
        return response
    }

    if (!response.ok) {
        throw json(
            {message: 'You could not be registered!'},
            {status: response.status}
        )
    }

    const tokens = await response.json();
    localStorage.setItem('demoShopAccesstoken', tokens.access)
    localStorage.setItem('demoShopRefreshtoken', tokens.refresh)

    let expirationDate = new Date();
    expirationDate.setHours(expirationDate.getHours() + 1);
    localStorage.setItem('demoShopExpirationDate', expirationDate.toISOString())

    return redirect('/')
}