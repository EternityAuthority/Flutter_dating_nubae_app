import 'package:nubae/models/message.dart';
import 'package:nubae/models/typingStatus.dart';

class Chat {
  String id;
  List<String> members = [];
  List<Message> messages = [];
  List<TypingStatus> typingStatuses = [];
  String ownerID;

  Chat(
    {
      this.id,
      this.members,
      this.ownerID,
      this.messages,
      this.typingStatuses
    }
  );

  Chat.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];   
    for(int i = 0; i < json['members'].length; i++){
      members.add(json['members'][i]);
    }
    for(int i=0; i < json['messages'].length; i++){
      messages.add(Message.fromJson(json['messages'][i]));
    }
    for(int i=0; i < json['typingStatuses'].length; i++){
      typingStatuses.add(TypingStatus.fromJson(json['typingStatuses'][i]));
    }
    ownerID = json['ownerID'];
  }

  Map<dynamic, dynamic> toJson() => {
    "id": id,
    "members" : members,
    "messages" : messages.map((message) => message.toJson()).toList(),
    "typingStatuses" : typingStatuses.map((typingStatus) => typingStatus.toJson()).toList(),
    "ownerID" : ownerID,
  };
}