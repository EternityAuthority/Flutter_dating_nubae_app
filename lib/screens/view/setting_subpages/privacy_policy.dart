import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';

class PrivacyPolicyPage extends StatefulWidget {
  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
        title: Text("Privacy Policy"),
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
              "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Personal Data",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white70),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . Email address",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . First name and last name",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . Phone number",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . Address, State, Province, ZIP/Postal code, City",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Usage Data",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white70),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "  . Usage Data is collected automatically when using the Service.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . Usage Data may include information such as Your Device's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
             Text(
              "Payments",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white70),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "  . We may provide paid products and/or services within the Service. In that case, we may use third-party services for payment processing (e.g. payment processors).",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  . We will not store or collect Your payment card details. That information is provided directly to Our third-party payment processors whose use of Your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white60),
            ),
            SizedBox(
              height: 10,
            ),
            
          
          ]),
        ),
      ),
    );
  }
}
