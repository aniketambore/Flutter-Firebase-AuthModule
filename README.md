# 🎯 Flutter & Firebase: Email/Password Registration & Sign-in 🎯

This Project shows how to implement Email/Password Authentication process in Flutter, using Firebase.

## Project Features
- Improved widget tree.
- TextFormField Validatior logic.
- Toggle password text visibility.
- Handling Authentication errors in UI.
- Custom submit button with loading state.
- UI logic and Firebase authentication logic, separated.

## Preview
<img src="https://i.ibb.co/34xg5Dw/Screenrecorder-2020-11-25-17-15.gif" />

### RegisterPage
<img src="https://i.ibb.co/sbmM2Hz/Pics-Art-11-25-06-08-53.jpg" />


***signUp()***
- Authenticating the user with email and password.
- Return appropriate message when user "Signed Up".
- Return appropriate message when FirebaseAuthException catches error.


***addUserToDb()***
- Create that "Signed Up" user referrence in Cloud Firestore.

### LoginPage
<img src="https://i.ibb.co/Js3ZxJR/Pics-Art-11-25-06-19-02.jpg" />


***signIn()***
- SignIn with email and password.
- Return appropriate message when user "Signed In".
- Return appropriate message when FirebaseAuthException catches error.


### HomePage
<img src="https://i.ibb.co/0KbTGSZ/Screenshot-2020-11-25-18-25-40-441-com-picsart-studio.jpg" />

***getCurrentUserFromDB()***
- Getting the stored user refference from Cloud Firestore.



## Running the project with Firebase

To use this project with Firebase authentication, some configuration steps are required.

- Create a new project with the Firebase console.
- Add iOS and Android apps in the Firebase project settings.
- On Android, use `com.aniket.flutter_auth.flutter_auth_example` as the package name.
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_android_app) `google-services.json` into `android/app`.

See this document for full instructions:

- [https://firebase.flutter.dev/docs/overview](https://firebase.flutter.dev/docs/overview)  
- [https://firebase.flutter.dev/docs/auth/overview](https://firebase.flutter.dev/docs/auth/overview)

## TODO
- [ ] Email Verification
- [ ] Password Reset

> Feel free to use this is your own project. 👨‍💻