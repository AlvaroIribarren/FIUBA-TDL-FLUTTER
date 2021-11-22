import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/components/annotator_widget.dart';
import 'package:truco_argentino_hardcoders/components/players_hand.dart';
import 'package:truco_argentino_hardcoders/components/turn_actions.dart';
import 'package:truco_argentino_hardcoders/components/user_data.dart';
import 'package:truco_argentino_hardcoders/models/card_model.dart';
import 'package:truco_argentino_hardcoders/services/game_provider.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, model, child) {
        return model.players.isNotEmpty
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  // borderRadius: BorderRadius.circular(29),
                ),
                child: Stack(
                  children: [
                    PlayersHandContainer(
                      currentHand: model.players[1].currentHand,
                      isMainPlayer: false,
                    ),
                    PlayersHandContainer(
                        currentHand: model.players[0].currentHand,
                        isMainPlayer: true,
                        onPlayCard: (CardModel card) {
                          model.playCard(player: model.players[0], card: card);
                        }),
                    TurnActionsContainer(actions: model.getTurnActions()),
                    AnnotatorWidget(annotator: model.annotator),
                  ],
                ),
              )
            : Center(child: UserData());
      },
    );
  }
}

// Pensar lógica de que un deck me dé las 6 cartas