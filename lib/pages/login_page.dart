import 'package:flutter/material.dart';
import 'package:flutter_apis_rest/pages/utils/responsive.dart';
import 'package:flutter_apis_rest/widgets/circle.dart';
import 'package:flutter_apis_rest/widgets/icon_container.dart';
import 'package:flutter_apis_rest/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.hp(100),
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
                  top: 130,
                  child: IconContainer(
                    size: responsive.wp(17),
                  ),
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
