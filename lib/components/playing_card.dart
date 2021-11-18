import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/card_model.dart';

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
        child: visible
            ? RoundedButton(
                color: Colors.blue.shade100,
                text: "${card.Value}",
              )
            : CardBack(),
      ),
    );
  }
}
