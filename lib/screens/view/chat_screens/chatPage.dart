import 'dart:async';

import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/firebase_services/chat_manager.dart';
import 'package:nubae/models/chat.dart';
import 'package:nubae/models/message.dart';
import 'package:nubae/screens/view/custom/slideLeftRoute.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:nubae/screens/view/chat_screens/chatsPage.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';
import 'package:nubae/screens/view/other_profile.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatPage extends StatefulWidget {
  String chatID;
  String receiverID;
  String receiverImage;
  String receiverName;

  ChatPage(
      {this.chatID, this.receiverID, this.receiverImage, this.receiverName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Profile profile;
  // Event event;
  List<Widget> photoWidgets = [];
  bool isLoad;
  String currentUid = SessionManager.getUserId();
  String messageText = "";
  ScrollController messagesController;
  ScrollController scrollController;
  TextEditingController messageController = TextEditingController();
  bool isTyping = false;
  Timer _timer;

  @override
  void initState() {
    messagesController = ScrollController();
    scrollController = ScrollController();
    isTyping = false;

    super.initState();
  }

  sendMessage() async {
    await ChatController.sendMessage(
      widget.chatID,
      widget.receiverID,
      Message(
        content: messageText,
        timestamp: Timestamp.now(),
        senderID: currentUid,
        type: "text",
      ),
    );
  }

  checkPossibleChat(String chatID) async {
    
  }

  updateTypingStatus(bool isTyping) async {
    await ChatController.updateTypingStatus(widget.chatID, isTyping);
  }

  typingStatus() {
    int _start = 5;
    if (_timer != null) {
      _timer.cancel();
    }
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start == 0) {
            timer.cancel();
            if (isTyping == true) {
              setState(() {
                isTyping = false;
              });
              updateTypingStatus(isTyping);
            }
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  readMessage() async {
    await ChatController.readMessage(widget.receiverID);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
        title: Text("Chats"),
        bottom: MyDivider(
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection("Chats")
            .where("id", isEqualTo: widget.chatID)
            .snapshots(),
        builder: (context, snapshot) {
          Timer(
            Duration(milliseconds: 50),
            () => {
              messagesController
                  .jumpTo(messagesController.position.maxScrollExtent),
            },
          );
          if (!snapshot.hasData) {
            return Container();
          }
          Chat chat = Chat.fromJson(snapshot.data.documents[0].data);
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 0, left: 0, right: 0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            margin: EdgeInsets.only(top: 20),
                            child: chat.messages.length > 0
                                ? chatPage(chat)
                                : Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Visibility(
                        visible: List.from(chat.typingStatuses.where(
                                        (typingStatus) =>
                                            typingStatus.memberID !=
                                            SessionManager.getUserId()))[0]
                                    .isTyping ==
                                true
                            ? true
                            : false,
                        child: Text(
                          "Typing...",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 70,
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: messageController,
                            validator: (_input) {
                              if (_input.length == 0) {
                                return "Please enter a message";
                              }
                              return null;
                            },
                            onChanged: (_input) {
                              _formKey.currentState.save();
                              setState(() {
                                messageText = _input;
                              });

                              if (isTyping == false) {
                                setState(() {
                                  isTyping = true;
                                });
                                updateTypingStatus(isTyping);
                              }

                              typingStatus();
                            },
                            decoration: InputDecoration(
                              hintText: "Send a message",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              fillColor: Colors.orange,
                              filled: true,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              if (SessionManager.getUserStatus() ==
                                  "Inactive") {
                                // checkPossibleChat()
                                 if (isTyping == true) {
                                  setState(() {
                                    isTyping = false;
                                  });
                                  updateTypingStatus(isTyping);
                                }
                                if (_formKey.currentState.validate()) {
                                  sendMessage();
                                  _formKey.currentState.reset();
                                  messageController.clear();
                                }
                              } else {
                                if (isTyping == true) {
                                  setState(() {
                                    isTyping = false;
                                  });
                                  updateTypingStatus(isTyping);
                                }
                                if (_formKey.currentState.validate()) {
                                  sendMessage();
                                  _formKey.currentState.reset();
                                  messageController.clear();
                                }
                              }
                            },
                            child: Text(
                              "Send",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border(
                          top: BorderSide(width: 0.5, color: Colors.grey))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget chatPage(Chat chat) {
    return ListView.builder(
      controller: messagesController,
      itemCount: chat.messages.length,
      itemBuilder: (BuildContext context, int index) {
        // if (index > 0) {
        return Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    timeago.format(chat.messages[index].timestamp.toDate()),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  )),
              Row(
                mainAxisAlignment: chat.messages[index].senderID == currentUid
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: <Widget>[
                  chat.messages[index].senderID == currentUid ||
                          chat.messages[index].type == "photo"
                      ? Container()
                      : widget.receiverImage != null &&
                              widget.receiverImage != ""
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadeRoute(
                                        page: OtherProfilePage(
                                      selecteduid:
                                          chat.messages[index].senderID,
                                    )));
                              },
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(widget.receiverImage),
                              ),
                            )
                          : CircleAvatar(
                              child: Center(
                                  child: Text(
                                widget.receiverName[0],
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                  SizedBox(
                    width: 5,
                  ),
                  chat.messages[index].type == "text"
                      ? Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            chat.messages[index].content,
                            style: TextStyle(
                                color:
                                    chat.messages[index].senderID == currentUid
                                        ? Colors.white
                                        : Colors.black),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6,
                          ),
                          decoration: BoxDecoration(
                              color: chat.messages[index].senderID == currentUid
                                  ? Color(0xff0070BA)
                                  : Color(0xffeae8eb),
                              borderRadius: BorderRadius.circular(8)),
                        )
                      : Column(
                          crossAxisAlignment:
                              chat.messages[index].senderID == currentUid
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    chat.messages[index].senderID == currentUid
                                        ? Color(0xff0070BA)
                                        : Color(0xffeae8eb),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Center(
                                  child: chat.messages[index].content == ""
                                      ? Text(
                                          chat.messages[index].senderID !=
                                                  SessionManager.getUserId()
                                              ? widget.receiverName[0]
                                              : SessionManager.getFirstName() +
                                                  SessionManager.getLastName(),
                                          style: TextStyle(
                                              fontSize: 100,
                                              color: Colors.white),
                                        )
                                      : Container(),
                                ),
                                decoration: chat.messages[index].content == ""
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xff0070BA),
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                chat.messages[index].content),
                                            fit: BoxFit.cover),
                                      ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Text(
                                chat.messages[index].content,
                                style: TextStyle(
                                    color: chat.messages[index].senderID ==
                                            currentUid
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    chat.messages[index].senderID == currentUid
                                        ? Color(0xff0070BA)
                                        : Color(0xffeae8eb),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ),
        );
        // }
      },
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
