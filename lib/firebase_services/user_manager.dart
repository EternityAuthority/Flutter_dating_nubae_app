import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/models/User.dart';
import 'basic_firebase.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/firebase_services/chat_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nubae/firebase_services/likes_manager.dart';
import 'package:nubae/firebase_services/subscribe_manager.dart';
import 'package:nubae/authentication/authentication.dart';

enum Gender { male, female }

class UserManager {
  static Future<List<User>> getData(String uid) async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<User> _list = [];
    List<User> _result = [];

    _list = querySnapshot.documents.map((doc) {
      return User.fromJson(doc.data);
    }).toList();

    for (int i = 0; i < _list.length; i++) {
      if (uid != _list[i].uid) {
        _result.add(_list[i]);
      }
    }
    return _result;
  }

  static Future<List<User>> searchData(
      double distance,
      double minAge,
      double maxAge,
      bool male,
      String cuisine,
      String entertainment,
      String recreation,
      double mylatitude,
      double mylongitude,
      String uid) async {
    QuerySnapshot querySnapshot = await db.collection("Users").getDocuments();
    List<User> _list = [];
    List<User> _result = [];

    _list = querySnapshot.documents.map((doc) {
      return User.fromJson(doc.data);
    }).toList();

    for (int i = 0; i < _list.length; i++) {
      if (uid != _list[i].uid) {
        double tempDistance = await getDistance(
            mylatitude, mylongitude, _list[i].latitude, _list[i].longitude);
        if (cuisine != "" && entertainment == "" && recreation == "") {
          if (_list[i].age >= minAge &&
              _list[i].age <= maxAge &&
              _list[i].male == male &&
              _list[i].cuisine == cuisine &&
              tempDistance <= distance) {
            _result.add(_list[i]);
          }
        }
        if (cuisine == "" && entertainment != "" && recreation == "") {
          if (_list[i].age >= minAge &&
              _list[i].age <= maxAge &&
              _list[i].male == male &&
              _list[i].entertainment == entertainment &&
              tempDistance <= distance) {
            _result.add(_list[i]);
          }
        }
        if (cuisine == "" && entertainment == "" && recreation != "") {
          if (_list[i].age >= minAge &&
              _list[i].age <= maxAge &&
              _list[i].male == male &&
              _list[i].recreation == recreation &&
              tempDistance <= distance) {
            _result.add(_list[i]);
          }
        }
      }
    }

    return _result;
  }

  static getDistance(
      double startlat, double startlon, double endlat, double endlon) async {
    double distanceInMeters =
        await Geolocator().distanceBetween(startlat, startlon, endlat, endlon);

    return distanceInMeters / 1000;
  }

  static addDeviceToken(String token) async {
    String myUid = SessionManager.getUserId();
    await db
        .collection('Users')
        .document(myUid)
        .updateData({'DeviceToken': token});
  }

  static deleteUser(String uid) async {
    QuerySnapshot docSnapShot1 = await db
        .collection('Users')
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (docSnapShot1.documents.length == 1) {
      docSnapShot1.documents[0].reference.delete();
    }
  }

  static deleteAccount(String uid) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    user.delete();

    SubscribeManager.deleteSubscribe(uid);
    LikesManager.deleteLikeForUid(uid);

    // Delete chat
    await ChatController.deleteAllChats();
    // Delete Users' chatParts chatting with this account
    await DateAuth.deleteAllChatParts();

    deleteUser(uid);
  }
}
