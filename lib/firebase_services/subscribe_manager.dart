import 'package:cloud_firestore/cloud_firestore.dart';
import 'basic_firebase.dart';

class SubscribeManager {
  static Future<void> addSubscribe(String myuid, String productID) async {
    await db.collection("Subscribes").document(myuid).get().then((doc) async {
      if (doc.exists) {
        QuerySnapshot docSnapShot = await db
            .collection("Subscribes")
            .where('uid', isEqualTo: myuid)
            .getDocuments();

        Timestamp subscribedDate = docSnapShot.documents[0]['subscribed_on'];

        final now = new DateTime.now();
        int days = now.difference(subscribedDate.toDate()).inDays;

        if (productID == "Month") {
          if (days >= 28) {
            docSnapShot.documents[0].reference.updateData({
              'product_id': productID,
              'subscribed_on': DateTime.now(),
              'status': 'Active'
            });
          }
        }
        if (productID == "Year") {
          if (days > 365) {
            docSnapShot.documents[0].reference.updateData({
              'product_id': productID,
              'subscribed_on': DateTime.now(),
              'status': 'Active'
            });
          }
        }

        print("=======   subscribed date ========");
        print(days);
      } else {
        QuerySnapshot docSnapShot = await db
            .collection("Subscribes")
            .where('uid', isEqualTo: myuid)
            .getDocuments();

        if (docSnapShot == null || docSnapShot.documents.length == 0) {
          await db.collection('Subscribes').document(myuid).setData({
            "uid": myuid,
            "product_id": productID,
            "subscribed_on": DateTime.now(),
            "status": 'Active'
          });
        }
      }
    });
  }

  static getUserStatus(String myuid) async {
    String result = "";
    await db.collection("Subscribes").document(myuid).get().then((doc) async {
      if (doc.exists) {
        QuerySnapshot docSnapShot = await db
            .collection("Subscribes")
            .where('uid', isEqualTo: myuid)
            .getDocuments();

        Timestamp subscribedDate = docSnapShot.documents[0]['subscribed_on'];
        String productID = docSnapShot.documents[0]['product_id'];

        final now = new DateTime.now();
        int days = now.difference(subscribedDate.toDate()).inDays;
        print("-------    days    --------");
        print(days);
        if (productID == "Month") {
          if (days > 30) {
            result = "Inactive";
          } else {
            result = "Active";
          }
        } else if (productID == "Year") {
          if (days > 365) {
            result = "Inactive";
          } else {
            result = "Active";
          }
        }
      } else {
        result = "Inactive";
      }
    });
    return result;
  }

  static alreadySubscribed(String myuid, String productID) async {
    String result = "";

    await db.collection("Subscribes").document(myuid).get().then((doc) async {
      if (doc.exists) {
        QuerySnapshot docSnapShot = await db
            .collection("Subscribes")
            .where('uid', isEqualTo: myuid)
            .getDocuments();

        Timestamp subscribedDate = docSnapShot.documents[0]['subscribed_on'];

        final now = new DateTime.now();
        int days = now.difference(subscribedDate.toDate()).inDays;

        if (productID == "Month") {
          if (days < 30) {
            result = "Impossible";
          } else {
            result = "possible";
          }
        }
        if (productID == "Year") {
          if (days < 365) {
            result = "Impossible";
          } else {
            result = "possible";
          }
        }
      } else {
        result = "possible";
      }
    });
    return result;
  }
  
  static deleteSubscribe(String uid) async{
    QuerySnapshot docSnapShot2 = await db
        .collection('Subscribes')
        .where('uid', isEqualTo: uid)
        .getDocuments();

    if (docSnapShot2.documents.length == 1) {
      docSnapShot2.documents[0].reference.delete();
    }
  }
}
