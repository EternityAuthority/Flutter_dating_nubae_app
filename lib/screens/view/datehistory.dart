import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/firebase_services/chat_manager.dart';
import 'package:nubae/models/chatPart.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/firebase_services/likes_manager.dart';
import 'package:nubae/screens/view/chat_screens/chatsPage.dart';

class DateHistory extends StatefulWidget {
  @override
  _DateHistoryState createState() => _DateHistoryState();
}

class _DateHistoryState extends State<DateHistory> {
  List<ChatPart> historyData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    List<ChatPart> _historyData = await ChatController.getDateHistory();
    setState(() {
      historyData = _historyData;
    });
  }

  addLikes(String likedUid) async {
    
    await LikesManager.addToLikes(SessionManager.getUserId(), likedUid);
  }

  convertTimeStamp(Timestamp timestamp) {
    DateTime _date =
        DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);
    String YYYY_MM_DD = _date.toIso8601String().split('T').first;

    return YYYY_MM_DD;
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
          title: Text("Date History"),
        ),
        backgroundColor: Colors.black,
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          height: height,
          child: GridView.builder(
            itemCount: historyData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(CupertinoPageRoute(
                      //     builder: (context) => ViewOffer(historyData[index])));
                    },
                    child: new GridTile(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(historyData[index].image),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${historyData[index].name}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              convertTimeStamp(historyData[index].timestamp),
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                addLikes(historyData[index].uid);
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => ChatsPage()));
                                // Navigator.of(context).push(CupertinoPageRoute(
                                //     builder: (context) =>
                                //         ViewOffer(historyData[index])));
                              },
                              color: Colors.orange,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Request Date",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              );
            },
          ),
        ));
  }
}

class ViewOffer extends StatefulWidget {
  final details;
  ViewOffer(this.details);

  @override
  _ViewOfferState createState() => _ViewOfferState();
}

class _ViewOfferState extends State<ViewOffer> {
  List _notifications;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _notifications = [
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
      {"message": "Sandy want to go on a date with you", "action": "accept"},
    ];
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
          title: Text("View Offer"),
        ),
        body: Container(
            width: width,
            height: height,
            child: ListView.builder(
              itemBuilder: (context, ind) => ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                  "${_notifications[ind]["message"]}",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: RaisedButton(
                  onPressed: () {},
                  color: Colors.orange,
                  child: Text(
                    "${_notifications[ind]["action"]}".toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              itemCount: _notifications.length,
            )));
  }
}
