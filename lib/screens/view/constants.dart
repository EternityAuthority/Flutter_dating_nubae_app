

import 'package:flutter/material.dart';

getWidth(context){
  return MediaQuery.of(context).size.width;
}

getHeight(context){
  return MediaQuery.of(context).size.height;
}

var welcomeStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

var cardTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25
);

var cardLocationStyle = TextStyle(
  color: Colors.grey,
  fontSize: 18
) ;

var loginTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.bold
);

var menuTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold
);

var loginButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20
);