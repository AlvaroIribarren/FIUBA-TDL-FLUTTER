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
  int order;
  final Widget child;
  CardModel({
    Key key,
    this.child,
    this.image,
    this.suit,
    this.value,
    this.order
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
    //this.updateOrder();
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
