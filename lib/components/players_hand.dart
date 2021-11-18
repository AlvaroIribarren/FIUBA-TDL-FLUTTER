import 'package:flutter/material.dart';
import 'package:flutter_auth/components/card_back.dart';
import 'package:flutter_auth/components/playing_card.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/card_model.dart';
import 'package:flutter_auth/models/player_model.dart';

class PlayersHandContainer extends StatelessWidget {
  final Widget child;
  final PlayerModel player;
  final double size;
  final Function(CardModel) onPlayCard;

  const PlayersHandContainer({
    Key key,
    this.child,
    this.player,
    this.size = 1,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: CARD_HEIGHT * size,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: player.cards.length,
          itemBuilder: (context, index) {
            final card = player.cards[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlayingCard(
                card: card,
                size: size,
                visible: player.isHuman,
                onPlayCard: onPlayCard,
              ),
            );
          },
        ));
  }
}
