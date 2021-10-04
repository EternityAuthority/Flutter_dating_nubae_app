import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/screens/view/datehistory.dart';
import 'package:nubae/screens/view/subscription.dart';
import 'package:nubae/screens/view/setting_subpages/aboutus.dart';
import 'package:nubae/screens/view/setting_subpages/contact_us.dart';
import 'package:nubae/screens/view/setting_subpages/privacy_policy.dart';
import 'package:nubae/screens/view/setting_subpages/termsandconditions.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Settings"),
        ),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          height: height,
          child: Column(
            children: [
              InkWell(
                  onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => DateHistory())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: width,
                      child: Text(
                        "Date History",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
              InkWell(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => SubscriptionPage())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: width,
                      child: Text(
                        "Subscription",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
              InkWell(
                  onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => AboutUsPage())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: width,
                      child: Text(
                        "About Us",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
              InkWell(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ContactUsPage())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: width,
                      child: Text(
                        "Contact Us",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
              // Container(
              //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              //     width: width,
              //     child: Text(
              //       "Help Center",
              //       style: TextStyle(color: Colors.white, fontSize: 18),
              //     )),
              InkWell(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => TermsAndConditionsPage())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: width,
                      child: Text(
                        "Terms & Conditions",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
              InkWell(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => PrivacyPolicyPage())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: width,
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
            ],
          ),
        ));
  }
}
