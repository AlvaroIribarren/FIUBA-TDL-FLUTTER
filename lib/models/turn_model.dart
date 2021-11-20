import 'package:flutter_auth/models/aceptar_envido_action.dart';
import 'package:flutter_auth/models/cantar_envido_action.dart';
import 'package:flutter_auth/models/player_model.dart';
import 'package:flutter_auth/models/rechazar_envido_action.dart';
import 'package:flutter_auth/models/turn_action.dart';
import 'package:flutter_auth/services/game_provider.dart';

class Turn {
  final List<PlayerModel> players;
  int index;
  PlayerModel currentPlayer;
  int playsCount;
  // List<bool> _cantoEnvido = [false, false];
  double turnNumber;

  Turn({
    this.players,
    this.currentPlayer,
    this.index = 0,
    this.turnNumber = 0,
    this.playsCount = 0,
  });

  void nextTurn() {
    turnNumber += 0.5; // deberia ser +1/2
    // index += 1;
    currentPlayer = otherPlayer;
    // playsCount += 1;
  }

  PlayerModel get otherPlayer {
    return players.firstWhere((p) => p != currentPlayer);
  }

  seCantoEnvido(PlayerModel player) {
    player.cantarEnvido();
    // var idx = players.indexOf(player);
    // _cantoEnvido[idx] = true;
  }

  // _yoCanteEnvido() {
  //   // return _cantoEnvido[players.indexOf(this.currentPlayer)];
  // }

  List<TurnAction> getTurnActions(GameProvider model) {
    if (!currentPlayer.cantoEnvido &&
        !otherPlayer.cantoEnvido &&
        turnNumber == 0) {
      return [
        CantarEnvidoAction(model: model, playerOwner: this.currentPlayer)
      ];
    } else if (!currentPlayer.cantoEnvido &&
        this.otherPlayer.cantoEnvido &&
        turnNumber == 0) {
      return [
        AceptarEnvidoAction(
          model: model,
          playerOwner: currentPlayer,
        ),
        RechazarEnvidoAction(
          model: model,
          playerOwner: currentPlayer,
        )
      ];
    }

    return [];
  }

  bool reachedEndOfTurn() {
    print("playscount es: $playsCount");
    return playsCount % 2 == 0;
  }

  PlayerModel getLoserPlayer() {
    print(turnNumber);
    var cardCurr =
        currentPlayer.currentHand.cardPlayedInTurn(turnNumber.toInt());
    var cardOther =
        otherPlayer.currentHand.cardPlayedInTurn(turnNumber.toInt());

    if (cardCurr > cardOther) {
      return otherPlayer;
    } else {
      return currentPlayer;
    }
  }

  asignarJugadorActual(PlayerModel player) {
    currentPlayer = player;
  }
}
