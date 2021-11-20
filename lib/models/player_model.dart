import 'package:flutter_auth/models/hand_model.dart';

import 'card_model.dart';

class PlayerModel {
  final String name;
  final bool isHuman;
  // List<CardModel> cards;
  // List<CardModel> discards = [];
  HandModel currentHand;
  bool cantoEnvido = false;

  PlayerModel({
    this.name,
    // this.cards = const [],
    this.isHuman = false,
    this.currentHand,
  });

  // addCards(List<CardModel> newCards) {
  //   cards = [...cards, ...newCards];
  // }

  // removeCard(CardModel card) {
  //   cards.removeWhere((c) => c.value == card.value);
  // }

  // addDiscards(CardModel newCards) {
  //   discards.add(newCards);
  // }

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

  // setEnvido(bool envido) {
  //   this.envido = envido;
  // }

  // bool get getEnvido => this.envido;

  // List<CardModel> get Discards => discards;
}
