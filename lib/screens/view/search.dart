import 'package:flutter/material.dart';
import 'package:nubae/models/User.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';
import 'package:nubae/screens/view/homepage.dart';
import 'package:nubae/firebase_services/user_manager.dart';
import 'package:nubae/firebase_services/profile_manager.dart';
import 'package:nubae/utils/session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

enum Gender { male, female }

class _SearchPageState extends State<SearchPage> {
  List<User> searchData = [];
  double _currentSliderValue = 20;

  Gender _character = Gender.male;
  RangeValues _currentRangeValues = const RangeValues(0, 40);

  String _cuisineValue = "";
  String _entertainmentValue = "";
  String _recreationValue = "";
  double myLatitude = 0.0;
  double myLongitude = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    getCoordinate();
    super.initState();
    print("=====   Test for sessiong   =====");
    print(SessionManager.getCity());
  }

  getCoordinate() async {
    double _mylat =
        await ProfileManager.getLatitude(SessionManager.getUserId());
    double _mylon =
        await ProfileManager.getLongitude(SessionManager.getUserId());
    setState(() {
      myLatitude = _mylat;
      myLongitude = _mylon;
    });
  }

  findDate() async {
    bool male;

    if (_character.toString() == "Gender.male") {
      male = true;
    } else {
      male = false;
    }

    searchData = await UserManager.searchData(
        _currentSliderValue,
        _currentRangeValues.start,
        _currentRangeValues.end,
        male,
        _cuisineValue,
        _entertainmentValue,
        _recreationValue,
        myLatitude,
        myLongitude,
        SessionManager.getUserId());

    Navigator.push(context, FadeRoute(page: HomePage(searchData: searchData)));
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Search Date"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        width: width,
        height: height,
        child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: width,
                child: Text(
                  "Maximum Distance",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                )),
            SizedBox(height: 15),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 5,
              activeColor: Colors.orange,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            SizedBox(height: 15),
            Container(
                width: width,
                child: Text(
                  "Age Range",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                )),
            SizedBox(height: 15),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 100,
              divisions: 5,
              activeColor: Colors.orange,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            SizedBox(height: 15),
            Container(
                width: width,
                child: Text(
                  "Show Me",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                )),
            SizedBox(height: 15),
            RadioListTile<Gender>(
              title: const Text(
                'Male',
                style: TextStyle(color: Colors.white),
              ),
              value: Gender.male,
              activeColor: Colors.orange,
              groupValue: _character,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Gender>(
              title:
                  const Text('Female', style: TextStyle(color: Colors.white)),
              value: Gender.female,
              groupValue: _character,
              activeColor: Colors.orange,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            SizedBox(height: 30),
            Container(
                width: width,
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
                          if (_entertainmentValue != "" ||
                              _recreationValue != "") {
                            Fluttertoast.showToast(
                                msg:
                                    "You can only one items on Cuisine, Entertainment, Recreation");
                            _cuisineValue = "";
                          } else {
                            _cuisineValue = newValue;
                          }
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
                          if (_cuisineValue != "" || _recreationValue != "") {
                            Fluttertoast.showToast(
                                msg:
                                    "You can only one items on Cuisine, Entertainment, Recreation");
                            _entertainmentValue = "";
                          } else {
                            _entertainmentValue = newValue;
                          }
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
                          if (_cuisineValue != "" ||
                              _entertainmentValue != "") {
                            Fluttertoast.showToast(
                                msg:
                                    "You can only one items on Cuisine, Entertainment, Recreation");
                            _recreationValue = "";
                          } else {
                            _recreationValue = newValue;
                          }
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
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.orange,
              onPressed: () {
                findDate();
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                width: width,
                child: Text(
                  "Find",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
