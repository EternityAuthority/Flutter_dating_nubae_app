import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:nubae/models/ProfileImages.dart';
import 'package:nubae/firebase_services/profile_manager.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';
import 'package:nubae/custom_widgets/custom_yes_cancel_dialog.dart';
import 'package:nubae/screens/view/search.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/firebase_services/user_manager.dart';
import 'package:nubae/verification/login_check.dart';

class ProfilePage extends StatefulWidget {
  final String selecteduid;
  ProfilePage({this.selecteduid});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _cuisineValue = "";
  String _entertainmentValue = "";
  String _recreationValue = "";
  File _image;

  ProfileImages myimages;
  String userName = "";
  String city = "";

  @override
  void initState() {
    super.initState();
    myimages = new ProfileImages(
        myimageURL: '', myphoto1URL: '', myphoto2URL: '', myphoto3URL: '');
    getImages();
    getHobby();
    getName();
    getLocation();
  }

  getImages() async {
    ProfileImages _getImages =
        await ProfileManager.getImages(widget.selecteduid);
    setState(() {
      myimages = _getImages;
    });
  }

  getName() async {
    String _getName = await ProfileManager.getUserName(widget.selecteduid);
    setState(() {
      userName = _getName;
    });
  }

  getLocation() async {
    String _city = await ProfileManager.getLocation(widget.selecteduid);
    setState(() {
      city = _city;
    });
  }

  deleteAccount(String uid) async {
    await UserManager.deleteAccount(uid);
    signOut();
  }

  signOut() async {
    try {
      SessionManager.handleClearAllSettging();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginCheck()),
      );
    } catch (e) {
      print(e);
    }
  }

  getHobby() async {
    String cuisineValue =
        await ProfileManager.getHobbyCuisine(widget.selecteduid);
    String entertainmentValue =
        await ProfileManager.getHobbyEntertainment(widget.selecteduid);
    String recreationValue =
        await ProfileManager.getHobbyRecreation(widget.selecteduid);

    setState(() {
      _cuisineValue = cuisineValue;
      _entertainmentValue = entertainmentValue;
      _recreationValue = recreationValue;
    });
  }

  Future updateImage(imageType) async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('profilebuild/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((fileURL) {
      // CoverImageModel coverImage = CoverImageModel(
      //     imageURL: fileURL,
      //     description: description,
      //     tag: tag,
      //     reference: reference);
      // BuildderManager.updateCoverImage(
      //     coverImage, widget.selecteduid, widget.id, widget.type);
      setState(() {
        if (imageType == "myimageURL") {
          myimages.myimageURL = fileURL;
        } else if (imageType == "myphoto1URL") {
          myimages.myphoto1URL = fileURL;
        } else if (imageType == "myphoto2URL") {
          myimages.myphoto2URL = fileURL;
        } else {
          myimages.myphoto3URL = fileURL;
        }

        _saveProfileBuilder();
      });
    });
  }

  Future selectImage(imageType) async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('profilebuild/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        if (imageType == "myimageURL") {
          myimages.myimageURL = fileURL;
        } else if (imageType == "myphoto1URL") {
          myimages.myphoto1URL = fileURL;
        } else if (imageType == "myphoto2URL") {
          myimages.myphoto2URL = fileURL;
        } else {
          myimages.myphoto3URL = fileURL;
        }

        _saveProfileBuilder();
      });
    });
  }

  _saveProfileBuilder() async {
    if (myimages.myimageURL != null && myimages.myimageURL != '') {
      ProfileImages sendmyImages = ProfileImages(
        myimageURL: myimages.myimageURL,
        myphoto1URL: myimages.myphoto1URL,
        myphoto2URL: myimages.myphoto2URL,
        myphoto3URL: myimages.myphoto3URL,
      );
      await ProfileManager.updateImages(sendmyImages, widget.selecteduid);
    }
  }

  _saveHobby(String hobbytype) async {
    String content = '';
    if (hobbytype == 'Cuisine') {
      content = _cuisineValue;
    } else if (hobbytype == 'Entertainment') {
      content = _entertainmentValue;
    } else if (hobbytype == 'Recreation') {
      content = _recreationValue;
    }

    await ProfileManager.updateHobby(hobbytype, content, widget.selecteduid);
  }

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    final width = getWidth(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.transparent, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1.0),
            child: Container(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, FadeRoute(page: SearchPage()));
                        },
                        child:
                            Icon(Icons.close, color: Colors.white, size: 30)),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: 30,
                      ),
                    ),
                    PopupMenuButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: new BorderSide(color: Color(0xFF272D3A))),
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                        new PopupMenuItem<String>(
                          child: Text('Delete',
                              style: TextStyle(color: Color(0xFF868E9C))),
                          value: 'Delete',
                          height: 40,
                        ),
                      ],
                      icon:
                          Icon(Icons.more_vert, size: 30, color: Colors.white),
                      onSelected: (value) async {
                        if (value == "Delete") {
                          ConfirmAction _selAction =
                              await CustomYesCancelDialog(context,
                                  title: 'Are you want to delete your account?',
                                  content: '');
                          if (_selAction == ConfirmAction.YES) {
                            deleteAccount(SessionManager.getUserId());
                          }
                          if (_selAction == ConfirmAction.NO) {
                            return;
                          }
                        }
                      },
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 30),
              myimages.myimageURL == null || myimages.myimageURL == ""
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        child: MaterialButton(
                          onPressed: () {
                            selectImage("myimageURL");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconTheme(
                                  data: new IconThemeData(color: Colors.black),
                                  child: new Icon(Icons.camera_enhance),
                                ),
                                Text(
                                  'Add Image',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Roboto Medium',
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : new GestureDetector(
                      onLongPress: () {
                        updateImage("myimageURL");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(myimages.myimageURL),
                        ),
                      ),
                    ),
              Text(
                userName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    city,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                  // color: Colors.white,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  myimages.myphoto1URL == null || myimages.myphoto1URL == ""
                      ? Stack(children: <Widget>[
                          Container(
                            width: width * 0.45 + 5,
                            height: MediaQuery.of(context).size.height * 0.4,
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 10, bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/images/loader.gif',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.11, top: height * 0.16),
                            child: MaterialButton(
                              onPressed: () {
                                selectImage("myphoto1URL");
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconTheme(
                                      data: new IconThemeData(
                                          color: Colors.white),
                                      child: new Icon(Icons.camera_enhance),
                                    ),
                                    Text(
                                      'Add Image',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Roboto Medium',
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])
                      : new GestureDetector(
                          onLongPress: () {
                            updateImage("myphoto1URL");
                          },
                          child: Container(
                            width: width * 0.45 + 10,
                            height: MediaQuery.of(context).size.height * 0.4,
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 10, bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                myimages.myphoto1URL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                  Column(
                    children: <Widget>[
                      myimages.myphoto2URL == null || myimages.myphoto2URL == ""
                          ? Stack(children: <Widget>[
                              Container(
                                width: width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                padding: EdgeInsets.only(
                                    left: 0.0,
                                    right: 10.0,
                                    top: 10,
                                    bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset('assets/images/loader.gif',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.08, top: height * 0.07),
                                child: MaterialButton(
                                  onPressed: () {
                                    selectImage("myphoto2URL");
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconTheme(
                                          data: new IconThemeData(
                                              color: Colors.white),
                                          child: new Icon(Icons.camera_enhance),
                                        ),
                                        Text(
                                          'Add Image',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto Medium',
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          : new GestureDetector(
                              onLongPress: () {
                                updateImage("myphoto2URL");
                              },
                              child: Container(
                                width: width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                padding: EdgeInsets.only(
                                    left: 0.0,
                                    right: 10.0,
                                    top: 10,
                                    bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    myimages.myphoto2URL,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                      myimages.myphoto3URL == null || myimages.myphoto3URL == ""
                          ? Stack(children: <Widget>[
                              Container(
                                width: width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                padding: EdgeInsets.only(
                                    left: 0.0, right: 10.0, top: 0, bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset('assets/images/loader.gif',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.08, top: height * 0.06),
                                child: MaterialButton(
                                  onPressed: () {
                                    selectImage("myphoto3URL");
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconTheme(
                                          data: new IconThemeData(
                                              color: Colors.white),
                                          child: new Icon(Icons.camera_enhance),
                                        ),
                                        Text(
                                          'Add Image',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto Medium',
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          : new GestureDetector(
                              onLongPress: () {
                                updateImage("myphoto3URL");
                              },
                              child: Container(
                                width: width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                padding: EdgeInsets.only(
                                    left: 0.0, right: 10.0, top: 0, bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    myimages.myphoto3URL,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Select your date option",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                  width: width,
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cuisine",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        value: _cuisineValue,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        onChanged: (String newValue) {
                          setState(() {
                            _cuisineValue = newValue;
                            _saveHobby("Cuisine");
                          });
                        },
                        items: ["", "Brunch", "Lunch", "Dinner"]
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                      ),
                    ],
                  )),
              SizedBox(height: 30),
              Container(
                  width: width,
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Entertainment",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        value: _entertainmentValue,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        onChanged: (String newValue) {
                          setState(() {
                            _entertainmentValue = newValue;
                            _saveHobby("Entertainment");
                          });
                        },
                        items: ["", "Happy hour", "Hookah", "Movies", "Mall"]
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                      ),
                    ],
                  )),
              SizedBox(height: 30),
              Container(
                  width: width,
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Recreation",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        value: _recreationValue,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        onChanged: (String newValue) {
                          setState(() {
                            _recreationValue = newValue;
                            _saveHobby("Recreation");
                          });
                        },
                        items: ["", "Gym", "Park", "Biking", "Running"]
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                      ),
                    ],
                  )),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
