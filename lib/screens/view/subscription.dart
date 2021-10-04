import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/screens/view/subscribe/paypal_payment.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/firebase_services/subscribe_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  List _data = [
    {
      "name": "1",
    },
  ];
  int number = 1;

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
        title: Text("Subscription"),
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        height: height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                  onTap: () {},
                  child: new GridTile(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Get our premium plans",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27,
                                    color: Colors.orange)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text("1 Month",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                          ),
                          Text("\$5.99 ", style: TextStyle(fontSize: 24)),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () async {
                              String possible =
                                  await SubscribeManager.alreadySubscribed(
                                      SessionManager.getUserId(), "Month");
                              if (possible == "possible") {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PaypalPayment(
                                      onFinish: (number) async {
                                        // payment done
                                        print('order id: ' + number);
                                      },
                                      membershiptype: "Month",
                                    ),
                                  ),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg: "You have already subscribed");
                              }
                            },
                            color: Colors.orange,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                  onTap: () {},
                  child: new GridTile(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Get our premium plans",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27,
                                    color: Colors.orange)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text("1 Year",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                          ),
                          Text("\$71.89 ", style: TextStyle(fontSize: 24)),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () async {
                              String possible =
                                  await SubscribeManager.alreadySubscribed(
                                      SessionManager.getUserId(), "Month");
                              if (possible == "possible") {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PaypalPayment(
                                      onFinish: (number) async {
                                        // payment done
                                        print('order id: ' + number);
                                      },
                                      membershiptype: "Year",
                                    ),
                                  ),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg: "You have already subscribed");
                              }
                            },
                            color: Colors.orange,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
