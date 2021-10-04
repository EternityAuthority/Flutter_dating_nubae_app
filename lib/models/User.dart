import 'ProfileImages.dart';

class User {
  String uid;
  String firstName;
  String lastName;
  int age;
  String race;
  String city;
  bool male;
  String cuisine;
  String entertainment;
  String recreation;
  double latitude;
  double longitude;
  ProfileImages myimage;
  int phone;
  int postalcode;
  String country;
  DateTime signupDate;

  User({
    this.uid,
    this.firstName,
    this.lastName,
    this.age,
    this.race,
    this.city,
    this.male,
    this.cuisine,
    this.entertainment,
    this.recreation,
    this.latitude,
    this.longitude,
    this.myimage,
    this.phone,
    this.postalcode,
    this.country,
    this.signupDate,
  });

  User.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    race = json['race'];
    city = json['city'];
    male = json['male'];
    cuisine = json['Cuisine'];
    entertainment = json['Entertainment'];
    recreation = json['Recreation'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    myimage = ProfileImages.fromJson(json['images']);
    phone = json['phone'];
    postalcode = json['postalcode'];
    country = json['country'];
    signupDate = json['signupDate'].toDate();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['uid'] = this.uid;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['age'] = this.age;
    data['race'] = this.race;
    data['city'] = this.city;
    data['male'] = this.male;
    data['Cuisine'] = this.cuisine;
    data['Entertainment'] = this.entertainment;
    data['Recreation'] = this.recreation;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['myimage'] = this.myimage.toJson();
    data['phone'] = this.phone;
    data['postalcode'] = this.postalcode;
    data['country'] = this.country;
    data['signupDate'] = this.signupDate;
    return data;
  }
}
