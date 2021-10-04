import 'package:flutter/material.dart';
import 'package:nubae/authentication/authentication.dart';
import 'package:nubae/screens/view/cloud_message.dart';
import 'package:nubae/screens/view/login.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/screens/view/profile.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class LoginCheck extends StatefulWidget {
  LoginCheck({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    // SessionManager.handleClearAllSettging();
    DateAuth().getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
    // print("--------- login status ---------");
    // print(authStatus);
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  AuthStatus CheckAuthState() {
    String userId = SessionManager.getUserId();
    if (userId == null || userId.length == 0) return AuthStatus.NOT_LOGGED_IN;
    return AuthStatus.LOGGED_IN;
  }

  @override
  Widget build(BuildContext context) {
    authStatus = CheckAuthState();

    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return LoginPage();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginPage();
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return new CloudMessage();
        } else
          return LoginPage();
        break;
      default:
        return LoginPage();
    }
  }
}
