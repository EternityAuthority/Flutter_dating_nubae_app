import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nubae/firebase_services/basic_firebase.dart';
import 'package:nubae/models/ProfileImages.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/models/User.dart';

abstract class BaseAuth {
  
  Future<FirebaseUser> getCurrentUser();
  
  Future<String> signIn(String email, String password);

  Future<String> signUp(
      String email,
      String password,
      String firstname,
      String lastname,
      int age,
      bool maleGender,
      String race,
      String country,
      String city,
      LatLng userlocation,
      int phone,
      int postalcode);

  // Future<bool> signOut();

}

class DateAuth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      User userInfo = await getUserInfo(user.uid);
      SessionManager.saveUserInfoToLocal(userInfo);
      print('--------><-------: Firebase User: ' + user.toString());
      return user.uid;
    } catch (er) {
      print(er);
      return null;
    }
  }

  Future<String> signUp(
      String email,
      String password,
      String firstname,
      String lastname,
      int age,
      bool maleGender,
      String race,
      String country,
      String city,
      LatLng userlocation,
      int phone,
      int postalcode) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(result);
    FirebaseUser user = result.user;
    ProfileImages images = new ProfileImages(
        myimageURL: "", myphoto1URL: "", myphoto2URL: "", myphoto3URL: "");
    try {
      await Firestore.instance
          .collection("Users")
          .document(user.uid)
          .setData({
            "uid": user.uid,
            "firstName": firstname,
            "lastName": lastname,
            "email": email,
            "password": password,
            "age": age,
            "male": maleGender,
            "race": race,
            "country": country,
            "city": city,
            "latitude": userlocation.latitude,
            "longitude": userlocation.longitude,
            "images": images.toJson(),
            "Cuisine": "",
            "Entertainment": "",
            "Recreation": "",
            "phone": phone,
            "postalcode": postalcode,
            "signupDate" : DateTime.now(),
          })
          .then((result) => {})
          .catchError((err) => print(err));
      return user.uid;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> getUserInfo(String uid) async {
    QuerySnapshot docSnapShot = await db
        .collection('Users')
        .where('uid', isEqualTo: uid)
        .getDocuments();
    if (docSnapShot == null || docSnapShot.documents.length == 0) {
      return null;
    }
    return User.fromJson(docSnapShot.documents[0].data);
  }

  Future<bool> setUserInfo(User user) async {
    var userId = SessionManager.getUserId();

    final TransactionHandler txHandler = (Transaction tx) async {
      DocumentSnapshot ds = await tx.get(userCollection.document(userId));
      await tx.set(ds.reference, user.toJson());

      return {'updated': true};
    };

    return db.runTransaction(txHandler).then((res) {
      return res['updated'] as bool;
    }).catchError((error) {
      print(error);
      return false;
    });
  }
  static Future<void> deleteChat(String receiverID) async {
    await db.collection("Users")
      .document(SessionManager.getUserId())
      .collection("chats")
      .document(receiverID)
      .delete();

    await db.collection("Users")
      .document(receiverID)
      .collection("chats")
      .document(SessionManager.getUserId())
      .delete();
  }

  static Future<void> deleteAllChatParts() async {
    QuerySnapshot docSnapShot = await db
      .collection("Users")
      .getDocuments();

    await db.collection("Users")
      .document(SessionManager.getUserId())
      .collection("chats")
      .getDocuments().then((snapshot) {
        for(DocumentSnapshot ds in snapshot.documents){
          ds.reference.delete();
        }
      });
    
    for(int i=0; i < docSnapShot.documents.length; i++){
      await db.collection("Users")
        .document(docSnapShot.documents[i]['uid'])
        .collection("chats")
        .document(SessionManager.getUserId())
        .delete();
    }
  }
  
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

}
