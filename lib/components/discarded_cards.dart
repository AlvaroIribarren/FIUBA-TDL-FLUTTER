import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/components/playing_card.dart';
import 'package:truco_argentino_hardcoders/models/card_model.dart';

class DiscardedCards extends StatelessWidget {
  final List<CardModel> discardedCards;
  final Function(CardModel) onPlayCard;

  const DiscardedCards({
    Key key,
    this.discardedCards,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: this
          .discardedCards
          .map(
            (card) => Padding(
              padding: const EdgeInsets.all(6.0),
              child: PlayingCard(
                card: card,
                visible: true,
              ),
            ),
          )
          .toList(),
    );
  }
}
