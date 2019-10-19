import 'package:flutter/material.dart';
import 'Generics/Colors.dart';
import 'screens/SignIn.dart';
import 'screens/SignUp.dart';
import 'screens/Profile.dart';
import 'screens/aboutUs.dart';
import 'package:flutter/services.dart';
import 'screens/homepage.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .whenComplete(() {
    runApp(
      new MaterialApp(
      debugShowCheckedModeBanner: false,//removed debug banner
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/SignIn': (BuildContext context) => new SignIn(),
        '/SignUp': (BuildContext context) => new SignUp(),
        '/Profile': (BuildContext context) => new ProfilePage(),
        '/AboutUs': (BuildContext context) => new AboutUs(),
      },
      title: 'Freshko',
      theme: ThemeData(primaryColor: themeColor),
    ));
  });
}
