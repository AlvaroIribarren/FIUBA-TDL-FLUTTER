import 'package:flutter/material.dart';
import 'package:flutter_auth/components/card_back.dart';
import 'package:flutter_auth/components/discarded_cards.dart';
import 'package:flutter_auth/components/playing_card.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/card_model.dart';
import 'package:flutter_auth/models/hand_model.dart';
import 'package:flutter_auth/models/player_model.dart';

class PlayersHandContainer extends StatelessWidget {
  final Widget child;
  final HandModel currentHand;
  final double size;
  final bool isMainPlayer;
  final Function(CardModel) onPlayCard;

  const PlayersHandContainer({
    Key key,
    this.child,
    this.currentHand,
    this.size = 1,
    this.isMainPlayer,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          this.isMainPlayer ? Alignment.bottomCenter : Alignment.topCenter,
      child: Column(
        verticalDirection:
            this.isMainPlayer ? VerticalDirection.down : VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DiscardedCards(
              discardedCards: this.currentHand.Discards,
            ),
          ),
          SizedBox(
              height: CARD_HEIGHT * size,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: currentHand.cards.length,
                itemBuilder: (context, index) {
                  final card = currentHand.cards[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlayingCard(
                      card: card,
                      size: size,
                      visible: this.isMainPlayer,
                      onPlayCard: onPlayCard,
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
