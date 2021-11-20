import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/playing_card.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/card_model.dart';

class CardPlayed extends StatelessWidget {
  final List<CardModel> cards;
  final double size;

  const CardPlayed({
    Key key,
    this.cards,
    this.size = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw Container(
      width: CARD_WIDTH * size,
      height: CARD_HEIGHT * 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
      ),
      child: Stack(
        children: cards
            .map(
              (card) => PlayingCard(
                card: card,
                visible: true,
              ),
            )
            .toList(),
      ),
    );
  }
}
