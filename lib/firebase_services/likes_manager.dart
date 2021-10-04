import 'package:cloud_firestore/cloud_firestore.dart';
import 'basic_firebase.dart';
import 'package:nubae/firebase_services/profile_manager.dart';
import 'package:nubae/models/Like.dart';

class LikesManager {
  static addLikes(String myuid, String likeduid) async {
    String result = "";
    // await db
    //     .collection("Users")
    //     .document(myuid)
    //     .collection("chats")
    //     .document(likeduid)
    //     .get()
    //     .then((doc) async {
    //   if (doc.exists) {
    //   } else {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('myuid', isEqualTo: myuid)
        .where('likeduid', isEqualTo: likeduid)
        .getDocuments();

    if (docSnapShot == null || docSnapShot.documents.length == 0) {
      String userName = await ProfileManager.getUserName(myuid);
      String userImage = await ProfileManager.getProfileImage(myuid);
      await db.collection('Likes').document().setData({
        "myuid": myuid,
        "likeduid": likeduid,
        "imageformyuid": userImage,
        "userNameFormyuid": userName
      });
      result = "not exist";
    } else {
      docSnapShot.documents[0].reference.updateData({'likeduid': likeduid});
      result = "exist";
    }
    // }
    // });
    return result;
  }

  static Future<void> addToLikes(String myuid, String likeduid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('myuid', isEqualTo: myuid)
        .where('likeduid', isEqualTo: likeduid)
        .getDocuments();

    if (docSnapShot == null || docSnapShot.documents.length == 0) {
      String userName = await ProfileManager.getUserName(myuid);
      String userImage = await ProfileManager.getProfileImage(myuid);
      await db.collection('Likes').document().setData({
        "myuid": myuid,
        "likeduid": likeduid,
        "imageformyuid": userImage,
        "userNameFormyuid": userName
      });
    }
  }

  static Future<List<Like>> getLikesData(String myuid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Likes")
        .where('likeduid', isEqualTo: myuid)
        .getDocuments();

    List<Like> _list = [];

    _list = docSnapShot.documents.map((doc) {
      return Like.fromJson(doc.data);
    }).toList();

    return _list;
  }

  static Future<void> deleteLike(String myUid, String likedUid) async {
    QuerySnapshot docSnapShot = await db
        .collection('Likes')
        .where('myuid', isEqualTo: myUid)
        .where('likeduid', isEqualTo: likedUid)
        .getDocuments();

    if (docSnapShot.documents.length > 0) {
      docSnapShot.documents[0].reference.delete();
    }

    QuerySnapshot docSnapShot1 = await db
        .collection('Likes')
        .where('myuid', isEqualTo: likedUid)
        .where('likeduid', isEqualTo: myUid)
        .getDocuments();

    if (docSnapShot1.documents.length > 0) {
      docSnapShot1.documents[0].reference.delete();
    }
  }

  static deleteLikeForUid(String uid) async {
    QuerySnapshot docSnapShot = await db
        .collection('Likes')
        .where('myuid', isEqualTo: uid)
        .getDocuments();

    if (docSnapShot.documents.length > 0) {
      docSnapShot.documents[0].reference.delete();
    }

    QuerySnapshot docSnapShot1 = await db
        .collection('Likes')
        .where('likeduid', isEqualTo: uid)
        .getDocuments();

    if (docSnapShot1.documents.length > 0) {
      docSnapShot1.documents[0].reference.delete();
    }
  }
}
