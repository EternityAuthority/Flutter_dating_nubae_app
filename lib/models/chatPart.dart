import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPart {
  String uid;
  String chatID;
  String name;
  String image;
  String lastMessage;
  int unseenCount;
  Timestamp timestamp;
  Timestamp startDate;
  ChatPart({
    this.uid,
    this.chatID,
    this.name,
    this.image,
    this.lastMessage,
    this.unseenCount,
    this.timestamp,
    this.startDate,
  });

  ChatPart.fromJson(Map<dynamic, dynamic> json) {
    uid = json["uid"];
    chatID = json['chatID'];
    name = json['name'];
    image = json['image'];
    lastMessage = json['lastMessage'] != null ? json['lastMessage'] : "";
    unseenCount = json['unseenCount'];
    timestamp = json['timestamp'] != null ? json['timestamp'] : null;
    startDate = json['startDate'] != null ? json['startDate'] : null;
  }

  Map<dynamic, dynamic> toJson() => {
        "uid": uid,
        "chatID": chatID,
        "name": name,
        "image": image,
        "lastMessage": lastMessage,
        "unseenCount": unseenCount,
        "timestamp": timestamp,
        "startDate": startDate,
      };
}
