import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';


class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("About Us"),
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        height: height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
             Text(
                  "Nubae is a modern day dating App that encourages users to actually date! Whether you enjoy walks in the park, happy hour with friends, or a intellectual discussion over dinner, Nubae is the app to help match you with someone who finds pleasure in the same things. So what are you waiting for? Register now and go on a date today with your Nubae !",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
