import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/firebase_services/user_manager.dart';
import 'package:nubae/models/User.dart';
import 'package:nubae/firebase_services/likes_manager.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExploreProfilePage extends StatefulWidget {
  final User userDetails;
  ExploreProfilePage(this.userDetails);

  @override
  _ExploreProfilePageState createState() => _ExploreProfilePageState();
}

class _ExploreProfilePageState extends State<ExploreProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> addLikes(String likedUid) async {
    String result =
        await LikesManager.addLikes(SessionManager.getUserId(), likedUid);
    print("---------    --------");
    print(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              widget.userDetails.myimage.myimageURL,
            ),
            alignment: Alignment.topCenter,
          )),
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: width * 0.3,
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          )),
                      Container(
                          width: width * 0.3,
                          alignment: Alignment.center,
                          child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Explore Page",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ))),
                      SizedBox(
                        width: width * 0.3,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  height: height * 0.25,
                  child: Text(
                      "${widget.userDetails.firstName + " " + widget.userDetails.lastName}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  color: Colors.black,
                  height: height * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Age',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 15),
                        child: Text(
                          widget.userDetails.age.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Container(height: 0.3, color: Colors.white),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'City / State',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 15),
                        child: Text(
                          widget.userDetails.city,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.orange,
                        onPressed: () async {
                          String likeStatus =
                              await addLikes(widget.userDetails.uid);
                          print(likeStatus);
                          if (likeStatus == 'exist') {
                            Fluttertoast.showToast(
                                msg: "You have already dating with this user!");
                          } else {
                            Fluttertoast.showToast(
                                msg: "sent date request successfully!");
                          }
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          width: width,
                          child: Text(
                            "Date Request",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
