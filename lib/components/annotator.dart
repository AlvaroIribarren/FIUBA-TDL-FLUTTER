import 'package:flutter_auth/models/player_model.dart';

class Annotator {
  int roundPointsPlayer;
  int roundPointsBot;
  int turnPointsPlayer;
  int turnPointsBot;

  Annotator({
    this.roundPointsPlayer = 0,
    this.roundPointsBot = 0,
    this.turnPointsPlayer = 0,
    this.turnPointsBot = 0,
  });

  addPointsPerTurn(PlayerModel player, int points) {
    if (player.isHuman) {
      turnPointsPlayer += points;
    } else {
      turnPointsBot += points;
    }
  }

  newRound() {
    turnPointsBot = 0;
    turnPointsPlayer = 0;
  }

  bool endRound() {
    if (turnPointsPlayer == 2) {
      roundPointsPlayer += 1;
      return true;
    }
    if (turnPointsBot == 2) {
      roundPointsBot += 1;
      return true;
    }
    return false;
  }
}
