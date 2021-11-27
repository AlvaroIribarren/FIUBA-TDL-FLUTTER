import 'card_model.dart';

class HandModel {
  // final int roundNumber;
  List<CardModel> cards;
  List<CardModel> discards = [];
  // bool envido;

  HandModel({
    // this.roundNumber,
    this.cards,
  });

  // addCards(List<CardModel> newCards) {
  //   cards = [...cards, ...newCards];
  // }

  // removeCard(CardModel card) {
  //   cards.removeWhere((c) => c.value == card.value);
  // }

  discard(CardModel card) {
    cards.removeWhere((c) => c.value == card.value);
    discards.add(card);
  }

  CardModel cardPlayedInTurn(int turn) {
    return discards[turn];
  }

  List<CardModel> get Discards => discards;
}
