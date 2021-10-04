import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:nubae/scoped_models/app_model.dart';
import 'package:nubae/splash.dart';
import 'package:nubae/theme.dart';


class NubaeApp extends StatelessWidget {
  String receiveDeepLink = '';

  @override
  void initState() {
  
  }

  
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
              title: 'Nubae',
              theme: buildTheme(),
              home: 
                   SplashScreen(),
            ));
  }
}
