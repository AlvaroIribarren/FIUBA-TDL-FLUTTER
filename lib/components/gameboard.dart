import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/cards_played.dart';
import 'package:flutter_auth/components/players_hand.dart';
import 'package:flutter_auth/components/playing_card.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/card_model.dart';
import 'package:flutter_auth/models/player_model.dart';
import 'package:flutter_auth/services/game_provider.dart';
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
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: model.players[1].Discards
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
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: model.players[0].Discards
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
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // ignore: sdk_version_ui_as_code
                                if (model.turn.currentPlayer ==
                                        model.players[0] &&
                                    model.canEnvido(model.turn.currentPlayer))
                                  ElevatedButton(
                                    onPressed: model.canEndTurn
                                        ? () {
                                            model.envido(
                                                model.turn.currentPlayer);
                                          }
                                        : null,
                                    child: const Text("Envido!"),
                                  ),
                              ],
                            ),
                          ),
                          PlayersHandContainer(
                            player: model.players[0],
                            onPlayCard: (CardModel card) {
                              model.playCard(
                                  player: model.players[0], card: card);
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: PlayersHandContainer(
                        player: model.players[1],
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: TextButton(
                  child: Text("New Game?"),
                  onPressed: () {
                    final players = [
                      PlayerModel(name: "Fackz", isHuman: true),
                      PlayerModel(name: "Franco", isHuman: false),
                    ];
                    model.newGame(players);
                  },
                ),
              );
      },
    );
  }
}

// Pensar lógica de que un deck me dé las 6 cartas