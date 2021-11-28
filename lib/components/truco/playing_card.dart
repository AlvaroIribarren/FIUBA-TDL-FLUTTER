import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/constants.dart';
import 'package:truco_argentino_hardcoders/models/card_model.dart';

import 'card_back.dart';

class PlayingCard extends StatelessWidget {
  final CardModel card;
  final double size;
  final bool visible;
  final bool blocked;
  final Function(CardModel) onPlayCard;

  const PlayingCard({
    Key key,
    this.card,
    this.size = 1,
    this.visible = false,
    this.onPlayCard,
    this.blocked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPlayCard != null) onPlayCard(card);
      },
      child: Container(
        foregroundDecoration: BoxDecoration(
          color: blocked && visible
              ? Color.fromRGBO(128, 128, 128, 0.75)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4.8),
        ),
        height: CARD_HEIGHT * size,
        // width: CARD_WIDTH * size,
        // clipBehavior: Clip.antiAlias,
        child: visible ? Image.asset(card.image) : CardBack(),
      ),
    );
  }
}
