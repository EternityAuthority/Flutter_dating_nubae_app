import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderID;
  String content;
  Timestamp timestamp;
  String type;

  Message({
    this.senderID,
    this.content,
    this.timestamp,
    this.type,
  });

  Message.fromJson(Map<dynamic, dynamic> json) {
    senderID = json["senderID"];
    content = json['content'];
    timestamp = json['timestamp'];
    type = json['type'];
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "senderID": senderID,
      "content": content,
      "timestamp": timestamp,
      "type": type,
    };
  }
}
