import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/firebase_services/user_manager.dart';
import 'package:nubae/models/User.dart';
import 'package:nubae/screens/view/explore_profile.dart';
import 'package:nubae/utils/session_manager.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<User> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var _data = await UserManager.getData(SessionManager.getUserId());
    setState(() {
      data = _data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text("Explore Page"),
        ),
        backgroundColor: Colors.black,
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          height: height,
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: InkWell(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ExploreProfilePage(data[index]))),
                  child: new GridTile(
                    header: Container(
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.3),
                          Colors.transparent
                        ])),
                        child: new Text(
                          data[index].firstName + " " + data[index].lastName,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                    child: Image.network(
                      data[index].myimage.myimageURL,
                      fit: BoxFit.cover,
                    ), //just for testing, will fill with image later
                  ),
                ),
              );
            },
          ),
        ));
  }
}
