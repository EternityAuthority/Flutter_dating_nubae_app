import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/screens/view/forgotpassword.dart';
import 'package:nubae/screens/view/register.dart';
import 'package:nubae/authentication/authentication.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';
import 'package:nubae/screens/view/cloud_message.dart';
import 'package:nubae/screens/view/profile.dart';
import 'package:nubae/utils/session_manager.dart';

class LoginPage extends StatefulWidget {
  final String uid;
  LoginPage({this.uid});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    _logUserIn() async {
      var response = await DateAuth()
          .signIn(_emailController.text, _passwordController.text);

      print(response);
      if (response == null) {
        Fluttertoast.showToast(msg: "Couldn't sign you in");
      } else {
        Navigator.push(
            context,
            FadeRoute(
                page: CloudMessage()));
      }
    }

    // TODO: implement build
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage("assets/images/loginbackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                    ),
                    child: Text(
                      "Welcome Back",
                      style: welcomeStyle,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Login with your account",
                    style: loginTextStyle,
                  ),
                  SizedBox(height: height * 0.1),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: TextField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintText: "Email Address",
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        onPressed: () => _logUserIn(),
                        child: Container(
                          width: width,
                          alignment: Alignment.center,
                          height: 60,
                          child: Text(
                            "Login",
                            style: loginButtonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => ForgotPasswordPage())),
                        child: Container(
                            width: width,
                            alignment: Alignment.center,
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Text(
                                "Forgot Password?",
                                style:
                                    loginTextStyle.apply(color: Colors.white),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Or",
                        style: loginTextStyle.apply(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: FacebookSignInButton(
                              borderRadius: 30,
                              onPressed: () {
                                // call authentication logic
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          width: width,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: GoogleSignInButton(
                            borderRadius: 30,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () => Navigator.of(context).push(_createRoute()),
                    child: Container(
                      width: width,
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Don't have an account? Register Here",
                            style: loginTextStyle,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
