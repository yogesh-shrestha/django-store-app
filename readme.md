## Django-store-app
I created this store app to help me improve my django skills by making a project. 

Key features of the app: <br>
    - RESTful app with <i>Django Rest Framework</i> at the backend and <em>React JS</em> at the frontend.<br>
    - Authentication system with <em>Djoser</em> and <em>Simple JWT</em>. <br>

You can run the store app locally on your system. You need to follow these steps:

1. install `docker` (preferrably version 4.22.0) on your system.
2. Clone the repository
3. change directory <br>
    `cd store-app/api`
4. build docker images and run <br>
    `docker-compoose up --build` <br>

Development server starts at `http://localhost:8000/`

Fake SMTP Server starts in local server at (`http://localhost:5000/`) which is used for account activation and resetting password.

If database is not prepopulated with dummy data for some reasons, run `docker-compose run djangoapi python manage.py seed_db`.

<b>Superuser credentials </b> <br>
username: admin<br>
password: admin<br>
 



### Entity-Relationship Diagram
![alt ER diagram](./images/IRdiagram.png)

### Overview of store app
- Home Page <br>
![alt reset password](./images/homepage.png)

- User can sign up for membership. An email with activation link is sent to the user after sign up. User must click the link and follow the instruction to activate the account.
![alt SignUp](./images/signup.png)

- User can reset password. An email with reset link is sent to the user. User must click the link to reset password.
![alt reset password](./images/resetpwd.png)

- User can change password.
![alt reset password](./images/changepwd.png)

- User can add products to the cart.
![alt reset password](./images/addtocart.png)

- User can view own cart.
![alt reset password](./images/cart.png)