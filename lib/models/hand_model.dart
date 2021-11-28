import 'dart:math';

import 'card_model.dart';

class HandModel {
  List<CardModel> cards;
  List<CardModel> discards = [];
  bool bloqueada = false;
  // bool envido;

  HandModel({
    this.cards,
  });

  discard(CardModel card) {
    cards.removeWhere((c) => c.value == card.value);
    discards.add(card);
  }

  CardModel cardPlayedInTurn(int turn) {
    return discards[turn];
  }

  bloquear() {
    bloqueada = true;
  }

  desbloquear() {
    bloqueada = false;
  }

  int valorDeEnvido() {
    List<CardModel> allCards = cards + discards;
    // TODO: si tengo 10, 11, 12 de palos distintos tengo 0 de envido?
    List<int> envidos = allCards.map((e) => e.envidoValue).toList();

    for (var i = 0; i < allCards.length - 1; i++) {
      for (var j = 1; j < allCards.length; j++) {
        if (allCards[i].suit == allCards[j].suit && i != j) {
          envidos.add(20 + allCards[i].envidoValue + allCards[j].envidoValue);
        }
      }
    }
    int mejorValor = envidos.reduce(max);
    print(mejorValor);
    return mejorValor;
  }

  bool winsEnvido(HandModel opponentHand) {
    // TODO: arreglar empate
    return valorDeEnvido() > opponentHand.valorDeEnvido();
  }

  List<CardModel> get Discards => discards;
}
