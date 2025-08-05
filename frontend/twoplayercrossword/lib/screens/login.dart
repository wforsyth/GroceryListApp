import 'package:flutter/material.dart';
import 'package:twoplayercrossword/constants.dart';
import '../routes.dart';
import '../authorisation/loginRegister.dart';
import '../styling.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

//Logs user into application using function in Auth
//Pushes user to home screen if login is successful
  Future<void> login() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );

      Navigator.pushNamed(context, AppRoutes.home);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An unknown error occured: $e'),
      ));
    }
  }

//Login page requests that user enters email and password
//Provides button link to registration page if user is not registered
//Uses regex and if statements to ensure that both inputs have been entered and are valid
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controllerEmail,
                decoration: whiteInputDecoration('Email'),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: controllerPassword,
                decoration: whiteInputDecoration('Password'),
                textAlign: TextAlign.center,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    login();
                  }
                },
                child: Text('Login',
                    style: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Don\'t have an account? Register',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: kBackgroundColor,
                          decoration: TextDecoration.underline,
                          decorationColor: kBackgroundColor,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
