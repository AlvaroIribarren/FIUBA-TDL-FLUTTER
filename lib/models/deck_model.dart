import 'package:flutter_auth/models/card_model.dart';
import "dart:math";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckModel extends StatefulWidget{
  final String deck_id;
  final bool shuffled;
  final int remaining;


  const DeckModel({
    this.deck_id,
    this.shuffled,
    this.remaining,
  });



  @override
  DeckState createState() => DeckState();


}

class DeckState extends State<DeckModel> {
  // final List<Child> mList; // Do not mark this as final

  List<CardModel> cards = List.empty();

  initDeck() {
    _createCardOfType(Suit.Cups);
    _createCardOfType(Suit.Clubs);
    _createCardOfType(Suit.Golds);
    _createCardOfType(Suit.Swords);
  }

  _createCardOfType(Suit suit) {
    for (var i = 1; i <= 12; i++) {
      if (i != 8 && i != 9) {
        cards.add( CardModel(
          image: "",
          suit: suit.toString(),
          value: i,
          child: Text(i.toString() + suit.toString()),
        ));
        cards[i].updateOrder();
      }
    }
  }

  dealCards(){
    final _random = Random();
    var hand = List.empty();
    for(var i = 0; i < 3; i++) {
      hand.add(cards[_random.nextInt(cards.length)]);
    }
    return hand;
  }

  @override
  Widget build(BuildContext context) {
  }


}