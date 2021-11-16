import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/gameboard.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const GameBoard(),
    );
  }
}
