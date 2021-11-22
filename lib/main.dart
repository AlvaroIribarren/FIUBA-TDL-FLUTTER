//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/Screens/Welcome/welcome_screen.dart';
import 'package:truco_argentino_hardcoders/constants.dart';
import 'package:truco_argentino_hardcoders/services/game_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Truco Argentino',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
