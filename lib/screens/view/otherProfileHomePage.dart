import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubae/screens/view/chat.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/screens/view/explore.dart';
import 'package:nubae/screens/view/notification.dart';
import 'package:nubae/screens/view/profile.dart';
import 'package:nubae/screens/view/search.dart';
import 'package:nubae/screens/view/settings.dart';
import 'package:nubae/screens/view/login.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';
import 'package:nubae/models/ProfileImages.dart';
import 'package:nubae/firebase_services/profile_manager.dart';
import 'package:nubae/models/User.dart';
import 'package:nubae/firebase_services/likes_manager.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:nubae/verification/login_check.dart';
import 'package:nubae/screens/view/chat_screens/chatsPage.dart';
import 'package:nubae/firebase_services/subscribe_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtherProfileHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OtherProfileHomePageState();
}

class _OtherProfileHomePageState extends State<OtherProfileHomePage> with TickerProviderStateMixin {
  PageController _pageController = PageController();
  var currentPageValue = 0.0;

  CardController controller;
  String userStatus = "";
  ProfileImages myimages;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    myimages = new ProfileImages(
        myimageURL: '', myphoto1URL: '', myphoto2URL: '', myphoto3URL: '');
    getImages();

    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
    getUserStatus();
  }

  getUserStatus() async {
    String _userStatus =
        await SubscribeManager.getUserStatus(SessionManager.getUserId());
    setState(() {
      userStatus = _userStatus;
      print("========    %%%%%    ========");
      print(userStatus);
    });
  }

  getImages() async {
    ProfileImages _getImages =
        await ProfileManager.getImages(SessionManager.getUserId());
    setState(() {
      myimages = _getImages;
    });
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

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/nubaeLogo.png",
          height: height * 0.05,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        FadeRoute(
                            page: ProfilePage(
                          selecteduid: SessionManager.getUserId(),
                        ))),
                    child: Column(
                      children: [
                        myimages.myimageURL == ""
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                child: Icon(Icons.person,
                                    size: 40, color: Colors.orangeAccent),
                              )
                            : CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    NetworkImage(myimages.myimageURL),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Profile",
                            style: menuTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Home",
                            style: menuTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    // onTap: () => Navigator.of(context).push(
                    //     CupertinoPageRoute(builder: (context) => ChatPage())),
                    onTap: () =>
                        // Navigator.push(context, FadeRoute(page: ChatPage())),
                        Navigator.push(context, FadeRoute(page: ChatsPage())),
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Chat",
                              style: menuTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.push(context, FadeRoute(page: SearchPage())),
                    // onTap: () => Navigator.of(context).push(
                    //     CupertinoPageRoute(builder: (context) => SearchPage())),
                    child: Column(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Search Date",
                            style: menuTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      if (userStatus == "Active") {
                        Navigator.push(context, FadeRoute(page: ExplorePage()));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please subscribe on setting page");
                      }

                      // Navigator.of(context).push(CupertinoPageRoute(
                      //     builder: (context) => ExplorePage()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Explore",
                            style: menuTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, FadeRoute(page: NotificationPage()));
                      // Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> NotificationPage()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          MdiIcons.formatListText,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Notifications",
                            style: menuTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context, FadeRoute(page: SettingsPage())),
                    // onTap: ()=> Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> SettingsPage())),
                    child: Column(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Settings",
                            style: menuTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  IconButton(
                      onPressed: () {
                        signOut();
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Log Out",
                      style: menuTextStyle,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
      ),
    );
  }
}
