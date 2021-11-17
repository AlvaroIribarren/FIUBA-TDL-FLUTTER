import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'model/cards.dart';
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mazo = Mazo();

    return Scaffold(
      body: Text(mazo.dealCards().toString())
    );
  }
}
