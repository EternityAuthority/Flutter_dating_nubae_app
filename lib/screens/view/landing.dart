import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nubae/screens/view/login.dart';

class LandingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _LandingPageState();
}

class _LandingPageState extends State<LandingPage>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _checkIfUserIsLoggedIn();
  }

  _checkIfUserIsLoggedIn() async {
    Timer.run(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loginbackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}