import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/components/card_back.dart';
import 'package:truco_argentino_hardcoders/components/rounded_button.dart';

import '../constants.dart';

enum Suit {
  Swords,
  Golds,
  Clubs,
  Cups,
}

class CardModel extends StatelessWidget {
  final String image;
  final String value;
  final String suit;
  final int envidoValue;
  final int order;
  final Widget child;
  final bool visible;

  String get Value => value;
  // String get Suit => suit;
  int get EnvidoValue => envidoValue;

  const CardModel({
    Key key,
    this.child,
    this.image,
    this.value,
    this.suit,
    this.envidoValue,
    this.order,
    this.visible,
  }) : super(key: key);

  bool operator >(other) {
    // compare this to other
    print("${this.order} > ${other.order}");
    return this.order > other.order;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: CARD_HEIGHT * 1.5,
        width: CARD_WIDTH * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.8),
        ),
        clipBehavior: Clip.antiAlias,
        child: visible
            ? Image.asset(image)
            : CardBack(
                child: Image.asset("assets/images/r0.png"),
              ));
  }
}
