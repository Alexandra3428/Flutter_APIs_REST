import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apis_rest/api/authentication_api.dart';
import 'package:flutter_apis_rest/pages/home_page.dart';
import 'package:flutter_apis_rest/pages/utils/dialogs.dart';
import 'package:flutter_apis_rest/widgets/input_text.dart';
import 'package:logger/logger.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String? _email = '', _password = '', _username = '';
  AuthenticationAPI _authenticationAPI = AuthenticationAPI();
  Logger _logger = Logger();

  Future<void> _submit() async {
    final isOk = _formKey.currentState!.validate();
    print("form isOk: $isOk");
    if (isOk) {
      ProgressDialog.show(context);
      final response = await _authenticationAPI.register(
        _username!,
        _email!,
        _password!,
      );
      ProgressDialog.dissmiss(context);
      if (response.data != null) {
        _logger.i('register ok::: ${response.data}');

        Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (_) => false,
        );
      } else {
        _logger.e('register error status code ${response.error.statusCode}');
        _logger.e('register error message ${response.error.message}');
        _logger.e('register error data ${response.error.data}');

        Dialogs.alert(context, 'Error', response.error.message);
      }
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
                label: 'Username',
                keyboardType: TextInputType.emailAddress,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                onChanged: (String text) {
                  _username = text;
                },
                validator: (text) {
                  if (text!.trim().length < 5) {
                    return 'Invalid username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              InputText(
                label: 'Password',
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                onChanged: (String text) {
                  _password = text;
                },
                validator: (text) {
                  if (text!.trim().length < 5) {
                    return 'Invalid ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
                      'sign up',
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
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color.fromARGB(255, 252, 239, 125),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
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
