import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/firebase_services/likes_manager.dart';
import 'package:nubae/custom_widgets/custom_yes_cancel_dialog.dart';
import 'package:nubae/models/Like.dart';
import 'package:nubae/firebase_services/chat_manager.dart';
import 'package:nubae/screens/view/chat_screens/chatPage.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Like> likeData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLikesData();
  }

  getLikesData() async {
    List<Like> _likeData =
        await LikesManager.getLikesData(SessionManager.getUserId());
    setState(() {
      likeData = _likeData;
    });
  }

  createNewChat(String chatID, String likedUid, String receiverImage,
      String receiverUserName) async {
    ChatController.createNewChat(
            chatID, likedUid, "Hello", receiverImage, receiverUserName)
        .then((currentChatID) async{

      
      await LikesManager.deleteLike(SessionManager.getUserId(), likedUid);
      getLikesData();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ChatPage(
                  chatID: currentChatID,
                  receiverID: likedUid,
                  receiverName: receiverUserName,
                  receiverImage: receiverImage,
                )),
      );
    });
  }

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
          title: Text("Notifications"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: db
              .collection("likes")
              .where("likeduid", isEqualTo: SessionManager.getUserId())
              .snapshots(),
          builder: (context, snapshot) {
            return Container(
                width: width,
                height: height,
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(likeData[index].imageformyuid),
                      radius: 25,
                    ),
                    title: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: likeData[index].userNameFormyuid,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " want to go on a date with you",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]),
                    ),
                    trailing: RaisedButton(
                      onPressed: () async {
                        ConfirmAction _selAction = await CustomYesCancelDialog(
                            context,
                            title: 'is it a date?',
                            content: '');
                        if (_selAction == ConfirmAction.YES) {
                          String chatID =
                              db.collection("Likes").document().documentID;
                          createNewChat(
                              chatID,
                              likeData[index].myuid,
                              likeData[index].imageformyuid,
                              likeData[index].userNameFormyuid);
                        }
                        if (_selAction == ConfirmAction.NO) {
                          return;
                        }
                      },
                      color: Colors.orange,
                      child: Text(
                        "ACCEPT",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  itemCount: likeData.length,
                ));
          },
        ));
  }
}
