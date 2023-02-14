import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apis_rest/widgets/circle.dart';
import 'package:flutter_apis_rest/widgets/icon_container.dart';
import 'package:flutter_apis_rest/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 199, 192, 192),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -100,
                  left: -50,
                  child: Circle(
                    size: 240,
                    colors: [],
                  ),
                ),
                Positioned(
                  top: -140,
                  right: -50,
                  child: Circle(
                    size: 340,
                    colors: [],
                  ),
                ),
                Positioned(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Hello\nSign Up to get started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 130,
                  child: IconContainer(
                    size: 120,
                  ),
                ),
                RegisterForm(),
                Positioned(
                  left: 15,
                  top: 15,
                  child: CupertinoButton(
                    color: Colors.black26,
                    padding: EdgeInsets.all(10),
                    borderRadius: BorderRadius.circular(30),
                    child: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
