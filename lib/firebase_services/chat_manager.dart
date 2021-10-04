import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/models/chat.dart';
import 'package:nubae/models/chatPart.dart';
import 'package:nubae/models/message.dart';
import 'package:nubae/models/typingStatus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/firebase_services/profile_manager.dart';

class ChatController {
  static Future<String> createNewChat(String chatID, String receiverID,
      String message, String receiverImage, String receiverName) async {
    String currentChatID;
    await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .document(receiverID)
        .get()
        .then((doc) async {
      if (doc.exists) {
        currentChatID = ChatPart.fromJson(doc.data).chatID;
        sendMessage(
            currentChatID,
            receiverID,
            Message(
                content: message,
                senderID: receiverID,
                type: "text",
                timestamp: Timestamp.now()));
      } else {
        currentChatID = chatID;
        await db.collection("Chats").document(chatID).setData({
          "id": chatID,
          "members": [SessionManager.getUserId(), receiverID],
          "messages": [
            Message(
                    content: message,
                    senderID: receiverID,
                    type: "text",
                    timestamp: Timestamp.now())
                .toJson()
          ],
          "typingStatuses": [
            TypingStatus(memberID: SessionManager.getUserId(), isTyping: false)
                .toJson(),
            TypingStatus(memberID: receiverID, isTyping: false).toJson(),
          ],
          "ownerID": SessionManager.getUserId()
        });

        // Create subcollection on Users collection
        await db
            .collection('Users')
            .document(SessionManager.getUserId())
            .collection('chats')
            .document(receiverID)
            .setData({
          "chatID": chatID,
          "image": receiverImage,
          "lastMessage": "",
          "name": receiverName,
          "timestamp": Timestamp.now(),
          "uid": receiverID,
          "unseenCount": 0,
          "startDate": Timestamp.now(),
        });
        String myImage =
            await ProfileManager.getProfileImage(SessionManager.getUserId());
        String myUserName =
            await ProfileManager.getUserName(SessionManager.getUserId());
        await db
            .collection('Users')
            .document(receiverID)
            .collection('chats')
            .document(SessionManager.getUserId())
            .setData({
          "chatID": chatID,
          "image": myImage,
          "lastMessage": "",
          "name": myUserName,
          "timestamp": Timestamp.now(),
          "uid": SessionManager.getUserId(),
          "unseenCount": 0,
        });
      }
    });
    return currentChatID;
  }

  static Future<void> sendMessage(
      String chatID, String receiverID, Message message) async {
    await db.collection("Chats").document(chatID).updateData({
      "messages": FieldValue.arrayUnion([message.toJson()])
    });

    await db
        .collection("Users")
        .document(receiverID)
        .collection("chats")
        .document(SessionManager.getUserId())
        .updateData({
      "lastMessage": message.content,
      "timestamp": message.timestamp,
      "unseenCount": FieldValue.increment(1)
    });

    await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .document(receiverID)
        .updateData({
      "lastMessage": message.content,
      "timestamp": message.timestamp,
    });
  }

  static Future<void> updateTypingStatus(String chatID, bool isTyping) async {
    db.collection("Chats").document(chatID).get().then((doc) async {
      Chat chat = Chat.fromJson(doc.data);
      List<TypingStatus> typingStatuses = chat.typingStatuses;
      typingStatuses.forEach((typingStatus) {
        if (typingStatus.memberID == SessionManager.getUserId()) {
          typingStatus.isTyping = isTyping;
        }
      });
      await db.collection("Chats").document(chatID).updateData({
        "typingStatuses": typingStatuses
            .map((typingStatus) => typingStatus.toJson())
            .toList(),
      });
    });
  }

  static Future<void> readMessage(String receiverID) async {
    await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .document(receiverID)
        .updateData({"unseenCount": 0});
  }

  static Future<List<ChatPart>> getDateHistory() async {
    List<ChatPart> _list = [];

    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .getDocuments();

    if (querySnapshot == null || querySnapshot.documents.length == 0) {
      return [];
    }
    _list = querySnapshot.documents.map((doc) {
      return ChatPart.fromJson(doc.data);
    }).toList();
    return _list;
  }

  static Future<void> deleteAllChats() async {
    // Delete from Chats
    QuerySnapshot docSnapShot5 = await db
        .collection("Users")
        .document(SessionManager.getUserId())
        .collection("chats")
        .getDocuments();
    if (docSnapShot5.documents.length > 0) {
      List<ChatPart> _list = [];

      _list = docSnapShot5.documents.map((doc) {
        return ChatPart.fromJson(doc.data);
      }).toList();

      print("---------   list  -------");
      print(_list.length);

      for (int i = 0; i < _list.length; i++) {
        QuerySnapshot docSnapShot6 = await db
            .collection('Chats')
            .where('id', isEqualTo: _list[i].chatID)
            .getDocuments();

        if (docSnapShot6.documents.length == 1) {
          docSnapShot6.documents[0].reference.delete();
        }
      }
    } else {
      print("============ doc is not exist  ==========");
    }
  }
}
