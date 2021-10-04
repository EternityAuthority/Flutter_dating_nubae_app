import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/firebase_services/chat_manager.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/models/chatPart.dart';
import 'package:nubae/screens/view/custom/slideRightRoute.dart';
import 'package:nubae/screens/View/chat_screens/chatPage.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/other_profile.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  bool isLoad = false;

  readMessage(String receiverID) async {
    await ChatController.readMessage(receiverID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
        title: Text("Match"),
        bottom: MyDivider(
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection("Users")
            .document(SessionManager.getUserId())
            .collection("chats")
            .orderBy("timestamp", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading...",
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            );
          }

          List<ChatPart> chatParts = new List<ChatPart>();
          List<ChatPart> _chatParts = new List<ChatPart>();
          snapshot.data.documents.forEach((document) {
            chatParts.add(ChatPart.fromJson(document.data));
          });

          // final now = new DateTime.now();
          // print("=============== ---------------- ===============");
          // print(_chatParts[0].timestamp.toString());

          // for (int i = 0; i < _chatParts.length; i++) {
          //   if (SessionManager.getUserStatus() == "Inactive") {
          //     int difftimes =
          //         now.difference(_chatParts[i].startDate.toDate()).inHours;
          //     if (difftimes < 24) {
          //       chatParts.add(_chatParts[i]);
          //     }
          //   } else {
          //     chatParts.add(_chatParts[i]);
          //   }
          // }

          if (chatParts.length > 0) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 0, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Matches",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.separated(
                        primary: true,
                        separatorBuilder: (context, ind) => Container(
                          height: 1,
                          color: Colors.grey[300],
                        ),
                        itemCount: chatParts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                              // Navigator.push(
                              //   context,
                              //   SlideRightRoute(
                              //       page: ChatPage(
                              //           chatID: chatParts[index].chatID,
                              //           receiverID: chatParts[index].uid,
                              //           receiverImage: chatParts[index].image,
                              //           receiverName: chatParts[index].name)),
                              // ).then((value) {
                              //   if (chatParts[index].unseenCount > 0) {
                              //     readMessage(chatParts[index].uid);
                              //   }
                              // });

                              // },
                              // child:
                              Container(
                            height: 90,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: chatParts[index].image == null ||
                                          chatParts[index].image == ""
                                      ? GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FadeRoute(
                                                    page: OtherProfilePage(
                                                  selecteduid:
                                                      chatParts[index].uid,
                                                )));
                                          },
                                          child: Center(
                                              child: Text(
                                            chatParts[index].name[0],
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white),
                                          )))
                                      : GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FadeRoute(
                                                    page: OtherProfilePage(
                                                  selecteduid:
                                                      chatParts[index].uid,
                                                )));
                                          },
                                          child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  chatParts[index].image))),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.blue),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (chatParts[index].unseenCount > 0) {
                                        readMessage(chatParts[index].uid);
                                      }
                                      Navigator.push(
                                          context,
                                          SlideRightRoute(
                                              page: ChatPage(
                                                  chatID:
                                                      chatParts[index].chatID,
                                                  receiverID:
                                                      chatParts[index].uid,
                                                  receiverImage:
                                                      chatParts[index].image,
                                                  receiverName:
                                                      chatParts[index].name)));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            chatParts[index].name,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Flexible(
                                            child: Text(
                                                chatParts[index].lastMessage,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (chatParts[index].unseenCount > 0) {
                                      readMessage(chatParts[index].uid);
                                    }
                                    Navigator.push(
                                        context,
                                        SlideRightRoute(
                                            page: ChatPage(
                                                chatID: chatParts[index].chatID,
                                                receiverID:
                                                    chatParts[index].uid,
                                                receiverImage:
                                                    chatParts[index].image,
                                                receiverName:
                                                    chatParts[index].name)));
                                  },
                                  child: Text(
                                    timeago.format(
                                        chatParts[index].timestamp.toDate()),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                SizedBox(width: 10),
                                chatParts[index].unseenCount > 0
                                    ? Badge(
                                        badgeContent: Text(
                                          chatParts[index]
                                              .unseenCount
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("There are no Matches yet",
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            );
          }
        },
      ),
    );
  }
}

class MyDivider extends Divider implements PreferredSizeWidget {
  MyDivider({
    Key key,
    height = 16.0,
    indent = 0.0,
    color,
  })  : assert(height >= 0.0),
        super(
          key: key,
          height: height,
          indent: indent,
          color: color,
        ) {
    preferredSize = Size(double.infinity, height);
  }

  @override
  Size preferredSize;
}
