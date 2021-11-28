import 'package:truco_argentino_hardcoders/models/hand_model.dart';

import 'card_model.dart';

class PlayerModel {
  final String name;
  final bool isHuman;
  HandModel currentHand;
  bool cantoEnvido = false;

  PlayerModel({
    this.name,
    this.isHuman = false,
    this.currentHand,
  });

  assignNewHand(HandModel hand) {
    currentHand = hand;
  }

  discardCard(CardModel card) {
    currentHand.discard(card);
  }

  bloquearMano() {
    currentHand.bloquear();
  }

  desbloquearMano() {
    currentHand.desbloquear();
  }

  tieneManoBloqueada() {
    return currentHand.bloqueada;
  }

  bool get isBot {
    return !isHuman;
  }

  cantarEnvido() {
    cantoEnvido = true;
  }

  resetEnvido() {
    cantoEnvido = false;
  }

  // setEnvido(bool envido) {
  //   this.envido = envido;
  // }

  // bool get getEnvido => this.envido;

  // List<CardModel> get Discards => discards;
}
