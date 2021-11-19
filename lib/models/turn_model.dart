import 'package:flutter_auth/models/envido_action.dart';
import 'package:flutter_auth/models/player_model.dart';
import 'package:flutter_auth/models/turn_action.dart';

class Turn {
  final List<PlayerModel> players;
  int index;
  PlayerModel currentPlayer;
  int actionCount;

  Turn({
    this.players,
    this.currentPlayer,
    this.index = 0,
    this.actionCount = 0,
  });

  void nextTurn() {
    index += 1;
    currentPlayer = index % 2 == 0 ? players[0] : players[1];
    actionCount = 0;
  }

  PlayerModel get otherPlayer {
    return players.firstWhere((p) => p != currentPlayer);
  }

  List<TurnAction> getTurnActions() {
    if (this.currentPlayer == players[0] && this.currentPlayer.getEnvido) {
      return [EnvidoAction(players: players)];
    } else {
      return [];
    }
  }
}
