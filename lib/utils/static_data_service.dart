import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StaticDataService {
  static const double CAMERA_TILT = 80;
  static const double CAMERA_BEARING = 30;
  static const double CAMERA_ZOOM = 15;
  
  static const String API_KEY = 'AIzaSyBIAAC2DJx3v44z-ZJQBDhz-Jrg-UBvc8A';
  
  static const String TWITTER_KEY = 'IfcWffzMiS2aa0fcG2uOFxPLu';
  static const String TWITTER_SECRET =
      'VG9lDtIjkmXuBSRN3mlRbB5IpmASnwtpw71eULIPaqu5zcLRnk';

  static const String INSTAGRAM_KEY = '576649349662433';
  static const String INSTAGRAM_SECRET = '34686202ba0cb7c20ec701c49ffae839';

  static const LatLng kLake = LatLng(37.43296265331129, -122.08832357078792);
}
