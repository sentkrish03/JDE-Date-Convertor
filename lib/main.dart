import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

import './constant.dart';
import './homePage.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

Color hexToColor(int rgb) => new Color(0xFF000000 + rgb);

class MyApp extends StatelessWidget {
  static Color indi = hexToColor(0x32127A);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Julian Date Convertor',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: Colors.indigo[900],
          primarySwatch: Colors.indigo,
          fontFamily: "Arial",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kBodyTextColor),
          )),
      home: HomePage(),
    );
  }
}
