import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/card_back.dart';
import 'package:flutter_auth/components/rounded_button.dart';

import '../constants.dart';

// enum Suit {
//   Swords,
//   Golds,
//   Clubs,
//   Cups,
// }

class CardModel extends StatelessWidget {
  final String image;
  final String value;
  final String suit;
  final int envidoValue;
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
    this.envidoValue,
    this.visible,
  }) : super(key: key);

  updateOrder(){
    if((value >= 4 && value < 7) || (value >=10 && value <= 12)){
      order = value;
    } else if(value == 7 && ((suit == Suit.Cups.toString()) || (suit == Suit.Clubs.toString()))){
      order = value;
    }
    else if(value == 1 && suit != Suit.Swords.toString() && suit != Suit.Clubs.toString()){
      order = 13;
    } else if (value == 2) {
      order = 14;
    } else if (value == 3) {
      order = 15;
    } else if(value == 7 && suit == Suit.Golds.toString()){
      order = 16;
    } else if(value == 7 && suit == Suit.Golds.toString()){
      order = 17;
    } else if(value == 1 && suit == Suit.Clubs.toString()){
      order = 18;
    } else {
      order = 19;
    }

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
            ? RoundedButton(
                color: Colors.blue.shade100,
                text: "$value",
                press: () {
                  print("$value");
                },
              )
            : CardBack(
                child: RoundedButton(
                  color: Colors.black,
                  text: "Boca Abajo",
                  press: () {
                    print("not visible");
                  },
                ),
              ));
  }
}
