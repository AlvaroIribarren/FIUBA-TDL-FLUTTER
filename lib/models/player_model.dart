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
    this.currentHand = hand;
  }

  discardCard(CardModel card) {
    this.currentHand.discard(card);
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
