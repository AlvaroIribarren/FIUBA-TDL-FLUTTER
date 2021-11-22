import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/components/rounded_button.dart';
import 'package:truco_argentino_hardcoders/constants.dart';
import 'package:truco_argentino_hardcoders/models/card_model.dart';

import 'card_back.dart';

class PlayingCard extends StatelessWidget {
  final CardModel card;
  final double size;
  final bool visible;
  final Function(CardModel) onPlayCard;

  const PlayingCard({
    Key key,
    this.card,
    this.size = 1,
    this.visible = false,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPlayCard != null) onPlayCard(card);
      },
      child: Container(
        height: CARD_HEIGHT * size,
        width: CARD_WIDTH * size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.8),
        ),
        clipBehavior: Clip.antiAlias,
        child: visible ? Image.asset(card.image) : CardBack(),
      ),
    );
  }
}
