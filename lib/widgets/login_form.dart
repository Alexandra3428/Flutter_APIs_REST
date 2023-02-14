import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apis_rest/api/authentication_api.dart';
import 'package:flutter_apis_rest/widgets/input_text.dart';
import 'package:flutter_apis_rest/pages/home_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String? _email = '', _password = '';
  AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  Future<void> _submit() async {
    final isOk = _formKey.currentState!.validate();
    print("form isOk: $isOk");
    if (isOk) {
      ProgressDialog.show(context);
      final response = await _authenticationAPI.login(
        _email!,
        _password!,
      );
      ProgressDialog.dissmiss(context);
      if (response.data != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (_) => false,
        );
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Positioned(
      bottom: 30,
      child: Form(
        key: _formKey,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            children: <Widget>[
              InputText(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                onChanged: (String text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text!.contains('@')) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: 'Password',
                        obscureText: true,
                        borderEnabled: false,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onChanged: (String text) {
                          _password = text;
                        },
                        validator: (text) {
                          if (text!.trim().length == 0) {
                            return 'Invalid password';
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 252, 239, 125),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: _submit,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                  color: Color.fromARGB(255, 222, 176, 108),
                  disabledColor: Colors.blue[200],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: const Text(
                      'sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 252, 239, 125),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressDialog {
  static void show(BuildContext context) {}

  static void dissmiss(BuildContext context) {}
}

mixin _formKey {
  static var currentState;
}
