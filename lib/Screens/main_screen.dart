import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import '../models/cards.dart';
import 'package:flutter_auth/Screens/Login/components/gameboard.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var mazo = Mazo();

    return Scaffold(

      body: const GameBoard(),
    );
  }
}
