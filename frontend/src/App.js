import { createBrowserRouter, 
  RouterProvider } from "react-router-dom";
import RootLayout from "./pages/Root";
import Home, { productsLoader } from "./pages/Home";
import ProductDetail, { productDetailLoader } from "./pages/ProductDetail";
import CategoryProducts, { categoryProductsLoader,} from "./pages/CategoryProducts";
import Error from "./pages/Error";
import SignIn, { actionSignIn } from "./pages/SignIn";
import SignUp, { actionSignUp } from "./pages/SignUp";
import Activate, { activateAction } from "./pages/Activate";
import ResetPassword, { resetPasswordAction } from "./pages/ResetPassword";
import ResetPasswordConfirm, { resetPasswordConfirmAction } from "./pages/ResetPasswordConfirm";
import SetPassword, { setPasswordAction } from "./pages/SetPassword";
import { actionLogout } from "./pages/Logout";
import CartItems, { cartItemsLoader } from "./pages/CartItems";
import { tokenLoader } from "./utils/auth";
import Profile, { profileLoader } from "./pages/profile";


const router = createBrowserRouter([
    {
        path: "/",
        element: <RootLayout />,
        errorElement: <Error />,
        id: 'root',
        loader: tokenLoader,
        children: [
          {
              path: "/",
              element: <Home />,
              loader: productsLoader,
          },
          {
              path: "/products/:productId",
              element: <ProductDetail />,
              loader: productDetailLoader,
          },
          {
              path: "/categories/:catId/products",
              element: <CategoryProducts />,
              loader: categoryProductsLoader,
          },
          {
            path: "/cartitems",
            element: <CartItems />,
            loader: cartItemsLoader
          },
          {
            path: "/accounts/sign-in",
            element: <SignIn />,
            action: actionSignIn,
          },
          {
            path: "/accounts/sign-up",
            element: <SignUp />,
            action: actionSignUp,
          },
          {
            path: "accounts/activate/:uid/:token",
            element: <Activate />,
            action: activateAction,
          },
          {
            path: "/accounts/logout",
            action: actionLogout,
          },
          {
            path: "/accounts/reset-password",
            element: <ResetPassword />,
            action: resetPasswordAction,
          },
          {
            path: "/accounts/reset-password/:uid/:token",
            element: <ResetPasswordConfirm />,
            action: resetPasswordConfirmAction,
          },
          {
            path: "accounts/set-password",
            element: <SetPassword />,
            action: setPasswordAction,
          },
          {
            path: "accounts/me",
            element: <Profile />,
            loader: profileLoader,
          }

        ],
    },
]);






function App() {

  return (
      <RouterProvider router={router} />     
  )
    
}

export default App;
