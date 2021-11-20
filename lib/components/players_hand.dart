import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/card_model.dart';
import "dart:math";

class PlayersHandContainer extends StatefulWidget {
  final Widget child;

  const PlayersHandContainer({
    Key key,
    this.child,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _PlayerHandState();
}

class _PlayerHandState extends State<PlayersHandContainer> {
  List<CardModel> cards = List.empty();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    cards = dealCards();
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: this.cards[0]),
        Align(
            alignment: Alignment.bottomCenter,
            child: this.cards[1]),
        Align(
            alignment: Alignment.bottomRight,
            child:this.cards[2]),
      ],
    );
  }

  @override
  void initState(){
    super.initState();
    initDeck();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void initDeck() {
    _createCardOfType(Suit.Cups);
    _createCardOfType(Suit.Clubs);
    _createCardOfType(Suit.Golds);
    _createCardOfType(Suit.Swords);
  }

  void _createCardOfType(Suit suit) {
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
}
