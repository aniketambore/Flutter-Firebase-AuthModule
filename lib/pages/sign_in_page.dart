import 'package:flutter/material.dart';
import 'package:flutter_auth_example/pages/sign_in/email_sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.cyan[400],
      ),
      body: EmailSignInForm.create(context),
    );
  }
}
