import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Suit {
  Swords,
  Golds,
  Clubs,
  Cups,
}

class CardModel extends StatelessWidget {
  final String image;
  final String suit;
  final int value;
  final Widget child;
  const CardModel({
    Key key,
    this.child,
    this.image,
    this.suit,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(29),
        ),
        child: Text("${this.value} " + this.suit),
      ),
    );
  }
}
