import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nubae/models/ProfileImages.dart';
import 'basic_firebase.dart';

class ProfileManager {
  static Future<void> updateImages(
      ProfileImages profileImages, String uid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    docSnapShot.documents[0].reference
        .updateData({'images': profileImages.toJson()});
  }

  static Future<void> updateHobby(
      String hobbyType, String content, String uid) async {
    QuerySnapshot docSnapShot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    docSnapShot.documents[0].reference.updateData({hobbyType: content});
  }

  static Future<ProfileImages> getImages(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['images'] == null) {
      ProfileImages _initImages = new ProfileImages(
          myimageURL: '', myphoto1URL: '', myphoto2URL: '', myphoto3URL: '');
      querySnapshot.documents[0].reference
          .updateData({'images': _initImages.toJson()});

      return _initImages;
    } else {
      ProfileImages _result =
          ProfileImages.fromJson(querySnapshot.documents[0]['images']);
      return _result;
    }
  }

  static Future<String> getProfileImage(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['images'] == null) {
      return "";
    } else {
      ProfileImages _result =
          ProfileImages.fromJson(querySnapshot.documents[0]['images']);
      return _result.myimageURL;
    }
  }

  static Future<String> getUserName(String uid) async {
    String result = "";
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['firstName'] == null) {
      return "";
    } else {
      String firstName = querySnapshot.documents[0]['firstName'];
      String lastName = querySnapshot.documents[0]['lastName'];
      result = firstName + " " + lastName;
      return result;
    }
  }

  static Future<String> getLocation(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['city'] == null) {
      return "";
    } else {
      return querySnapshot.documents[0]['city'];
    }
  }

  static getLatitude(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['latitude'] == null) {
      return 0.0;
    } else {
      return querySnapshot.documents[0]['latitude'];
    }
  }

  static getLongitude(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['longitude'] == null) {
      return 0.0;
    } else {
      return querySnapshot.documents[0]['longitude'];
    }
  }

  static Future<String> getHobbyCuisine(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['Cuisine'] == null) {
      return "";
    } else {
      return querySnapshot.documents[0]['Cuisine'];
    }
  }

  static Future<String> getHobbyEntertainment(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['Entertainment'] == null) {
      return "";
    } else {
      return querySnapshot.documents[0]['Entertainment'];
    }
  }

  static Future<String> getHobbyRecreation(String uid) async {
    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (querySnapshot.documents[0]['Recreation'] == null) {
      return "";
    } else {
      return querySnapshot.documents[0]['Recreation'];
    }
  }
}
