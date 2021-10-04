import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';


class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
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
        title: Text("Contact Us"),
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Text(
                  "If you have any questions, You can contact us: ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
            ),
            Text(
                  "By email: getnubae111@gmail.com",
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
