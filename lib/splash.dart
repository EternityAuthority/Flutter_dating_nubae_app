import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nubae/authentication/authentication.dart';
import 'package:nubae/verification/login_check.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.indigo,
  Colors.pinkAccent,
  Color(0xFF2B8DD8),
];

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  navigationPage() async {
    Navigator.push(context, FadeRoute(page: LoginCheck(auth: new DateAuth())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/splash.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          Center(
            child: Image.asset('assets/images/nubaeLogo.png',
                width: 200, height: 70, fit: BoxFit.cover),
          )
        ],
      ),
    );
    // Center(
    //   child: Image.asset('assets/images/nubaeLogo.png'),
    // ),
  }
}
