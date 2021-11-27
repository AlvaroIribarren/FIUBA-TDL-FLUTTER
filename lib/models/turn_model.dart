import 'package:truco_argentino_hardcoders/models/aceptar_envido_action.dart';
import 'package:truco_argentino_hardcoders/models/cantar_envido_action.dart';
import 'package:truco_argentino_hardcoders/models/player_model.dart';
import 'package:truco_argentino_hardcoders/models/rechazar_envido_action.dart';
import 'package:truco_argentino_hardcoders/models/turn_action.dart';
import 'package:truco_argentino_hardcoders/services/game_provider.dart';

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
    asignarJugadorActual(otherPlayer);
    // playsCount += 1;
  }

  PlayerModel get otherPlayer {
    return players.firstWhere((p) => p != currentPlayer);
  }

  cantarEnvido(PlayerModel player) {
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
        turnNumber < 1) {
      return [
        CantarEnvidoAction(model: model, playerOwner: this.currentPlayer)
      ];
    } else if (!currentPlayer.cantoEnvido &&
        otherPlayer.cantoEnvido &&
        turnNumber < 1) {
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

  swapPlayerForFirstTurn(int currentRoundNumber) {
    print("-- Resultado de swap: ${currentRoundNumber % 2}");
    currentPlayer = players[currentRoundNumber % 2];
  }

  asignarJugadorActual(PlayerModel player) {
    currentPlayer = player;
  }
}
