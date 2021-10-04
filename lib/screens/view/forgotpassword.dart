import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:nubae/screens/view/constants.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    // TODO: implement build
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black, BlendMode.dstATop),
            image: AssetImage("assets/images/registerbackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: height * 0.1),
                      Column(
                        children: [
                          Text(
                            "Forgot Password",
                            style: welcomeStyle,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Enter your phone number to reset your password",
                            textAlign: TextAlign.center,
                            style: loginTextStyle,
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 120,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            color: Colors.black.withOpacity(0.5),
                            child: TextField(
                              decoration: InputDecoration(
                                  icon: Icon(Icons.phone_iphone,
                                      color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "Phone Number"),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RaisedButton(
                            color: Colors.orange,
                            onPressed: () {},
                            child: Container(
                              width: width,
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "Reset Password",
                                style: loginButtonTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 30,
                left: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
