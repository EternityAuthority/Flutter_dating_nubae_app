import 'package:cloud_firestore/cloud_firestore.dart';

class Like {
  String myuid;
  String likeduid;
  String imageformyuid;
  String userNameFormyuid;
  Timestamp timestamp;

  Like({
    this.myuid = '',
    this.likeduid = '',
    this.imageformyuid = '',
    this.userNameFormyuid = '',
    this.timestamp,
  });

  Like.fromJson(Map<dynamic, dynamic> json) {
    myuid = json['myuid'];
    likeduid = json['likeduid'];
    imageformyuid = json['imageformyuid'];
    userNameFormyuid = json['userNameFormyuid'];
    timestamp = json['timestamp'] != null ? json['timestamp'] : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['myuid'] = this.myuid;
    data['likeduid'] = this.likeduid;
    data['imageformyuid'] = this.imageformyuid;
    data['userNameFormyuid'] = this.userNameFormyuid;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
