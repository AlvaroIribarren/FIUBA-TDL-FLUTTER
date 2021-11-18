import 'card_model.dart';

class PlayerModel {
  final String name;
  final bool isHuman;
  List<CardModel> cards;
  List<CardModel> discards = [];
  bool envido;

  PlayerModel({
    this.name,
    this.cards = const [],
    this.isHuman = false,
    this.envido = true,
  });

  addCards(List<CardModel> newCards) {
    cards = [...cards, ...newCards];
  }

  removeCard(CardModel card) {
    cards.removeWhere((c) => c.value == card.value);
  }

  addDiscards(CardModel newCards) {
    discards.add(newCards);
  }

  bool get isBot {
    return !isHuman;
  }

  setEnvido(bool envido) {
    this.envido = envido;
  }

  bool get getEnvido => this.envido;

  List<CardModel> get Discards => discards;
}
