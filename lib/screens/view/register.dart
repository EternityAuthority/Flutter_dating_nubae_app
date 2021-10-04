import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nubae/authentication/authentication.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/screens/view/login.dart';
import 'package:nubae/screens/custom_widgets/fade_transition.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nubae/utils/static_data_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  LatLng _pubLatLang;

//  _textControllers

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _postalController = TextEditingController();
  TextEditingController _raceController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _nubaeAddressLocationController =
      TextEditingController();
  bool _male = false;

  _register() async {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _raceController.text.isNotEmpty &&
        _nubaeAddressLocationController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _postalController.text.isNotEmpty) {
      var resonse = await DateAuth().signUp(
          _emailController.text,
          _passwordController.text,
          _firstNameController.text,
          _lastNameController.text,
          int.parse(_ageController.text),
          _male,
          _raceController.text,
          _countryController.text,
          _nubaeAddressLocationController.text,
          _pubLatLang,
          int.parse(_phoneController.text),
          int.parse(_postalController.text));

      print("--------   ======   --------");
      print(resonse);
      if (resonse == null)
        return Fluttertoast.showToast(msg: "Couldn't sign you in");

      Navigator.push(context, FadeRoute(page: LoginPage()));
    } else {
      Fluttertoast.showToast(msg: "Fill All Areas to continue");
    }
  }

  _showLocationPicker() async {
    LocationResult result = await showLocationPicker(
      context,
      StaticDataService.API_KEY,
      initialCenter: LatLng(31.1975844, 29.9598339),
      myLocationButtonEnabled: true,
      layersButtonEnabled: true,
    );

    print("**********   88888888888   **********");
    print(result);
    _nubaeAddressLocationController.text = result.address;
    setState(() {
      _pubLatLang = result.latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter:
                  new ColorFilter.mode(Colors.black, BlendMode.dstATop),
              image: AssetImage("assets/images/datingregister.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: height * 0.06),
                        Column(
                          children: [
                            Text(
                              "Create Account",
                              style: welcomeStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "match and date TODAY!!!",
                              style: loginTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.black.withOpacity(0.5),
                              child: TextField(
                                controller: _firstNameController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.person, color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "First Name"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.black.withOpacity(0.5),
                              child: TextField(
                                controller: _lastNameController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.person, color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Last Name"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.black.withOpacity(0.5),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: _emailController,
                                decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.email, color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Email Address"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock, color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Password"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                controller: _ageController,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.calendar_today,
                                        color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Age"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: _phoneController,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.phone, color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Phone Number"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: _countryController,
                                decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.public, color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Country"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                controller: _postalController,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.location_on,
                                        color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Postal Code"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                _showLocationPicker();
                              },
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: IgnorePointer(
                                  child: TextField(
                                    controller: _nubaeAddressLocationController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.location_searching,
                                            color: Colors.white),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: "Set Location on Map"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: _raceController,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.face, color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Race"),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: width,
                              height: 50,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.orange),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _male = false;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: _male
                                                  ? Colors.transparent
                                                  : Colors.white),
                                          height: 50,
                                          width: width * 0.45,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "I'm a Woman",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _male = true;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: !_male
                                                  ? Colors.transparent
                                                  : Colors.white),
                                          height: 50,
                                          width: width * 0.45,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "I'm a Man",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            RaisedButton(
                              color: Colors.orange,
                              onPressed: () => _register(),
                              child: Container(
                                width: width,
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  "Register",
                                  style: loginButtonTextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                width: width,
                                padding: EdgeInsets.all(8),
                                alignment: Alignment.center,
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      "Already have an account? Login Here",
                                      style: loginTextStyle,
                                    )),
                              ),
                            )
                          ],
                        ),
//                    Column(
//                      children: [
//                        Text(
//                          "Or",
//                          style: loginTextStyle.apply(color: Colors.white),
//                        ),
//                      ],
//                    ),

//                    Column(
//                      children: [
//                        Container(
//                          width: width,
//                          height: 50,
//                          child: FacebookSignInButton(onPressed: () {
//                            // call authentication logic
//                          }),
//                        ),
//                        SizedBox(height: 30,),
//                        Container(
//                          height: 50,
//                          width: width,
//                          child: GoogleSignInButton(
//                            onPressed: () {},
//                          ),
//                        )
//                      ],
//                    ),

//                    Container(
//                      width: width,
//                      alignment: Alignment.center,
//                      child: Text("Don't have an account? Register Here",style: loginTextStyle,),
//                    )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
