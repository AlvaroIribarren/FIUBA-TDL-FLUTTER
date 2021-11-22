import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Leaderboard/leaderboard_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenState createState() {
    return new WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
