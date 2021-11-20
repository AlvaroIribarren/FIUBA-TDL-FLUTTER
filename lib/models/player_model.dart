import 'card_model.dart';

class PlayerModel {
  final String name;
  final bool isHuman;
  List<CardModel> cards;

  PlayerModel({
    this.name,
    this.cards = const [],
    this.isHuman = false,
  });
}
