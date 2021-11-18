import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/card_model.dart';
import 'package:flutter_auth/models/deck_model.dart';
import 'package:flutter_auth/models/player_model.dart';
import 'package:flutter_auth/models/turn_model.dart';

class GameProvider with ChangeNotifier {
  /*GameProvider() {
    _service = DeckModel();
  }*/

  bool _envido;

  Turn _turn;
  Turn get turn => _turn;

  List<PlayerModel> _players = [];
  List<PlayerModel> get players => _players;

  List<CardModel> _discards = [];
  List<CardModel> get discards => _discards;

  Map<String, dynamic> gameState = {};

  void newGame(List<PlayerModel> players) {
    print("Creating a new game");
    _players = players;
    _turn = Turn(players: players, currentPlayer: players.first);
    setupBoard(players);
    notifyListeners();
  }

  void setupBoard(List<PlayerModel> players) {
    var card1 = CardModel(
      image: "4 COPA",
      value: "4 COPA",
      suit: "COPA",
      envidoValue: 4,
      visible: true,
    );
    var card2 = CardModel(
      image: "3 COPA",
      value: "3 COPA",
      suit: "COPA",
      envidoValue: 3,
      visible: true,
    );
    var card3 = CardModel(
      image: "2 COPA",
      value: "2 COPA",
      suit: "COPA",
      envidoValue: 2,
      visible: true,
    );
    var card4 = CardModel(
      image: "11 BASTO",
      value: "11 BASTO",
      suit: "BASTO",
      envidoValue: 0,
      visible: true,
    );
    var card5 = CardModel(
      image: "1 BASTO",
      value: "1 BASTO",
      suit: "BASTO",
      envidoValue: 1,
      visible: true,
    );
    var card6 = CardModel(
      image: "4 ESPADA",
      value: "4 ESPADA",
      suit: "ESPADA",
      envidoValue: 4,
      visible: true,
    );
    var cards = [card1, card2, card3];
    var cards2 = [card4, card5, card6];
    players[0].addCards(cards2);
    players[1].addCards(cards);
    players[0].setEnvido(true);
    players[1].setEnvido(true);
    _envido = false;
    _discards = [];
  }

  bool canPlayCard(CardModel card) {
    return true;
  }

  bool canEnvido(PlayerModel player) {
    return player.getEnvido;
  }

  void envido(PlayerModel player) {
    print("Envido gato!");
    player.setEnvido(false);
    _envido = true;
    endTurn();
  }

  Future<void> playCard({
    PlayerModel player,
    CardModel card,
  }) async {
    if (player != _turn.currentPlayer) return;

    player.removeCard(card);

    player.addDiscards(card);

    _discards.add(card);

    _turn.actionCount += 1;

    player.setEnvido(false);

    endTurn();
  }

  bool get canEndTurn {
    return true;
    //Si no jugó una carta, no podría pasar el turno
  }

  void endTurn() {
    _turn.nextTurn();

    if (_turn.currentPlayer.isBot) {
      botTurn();
    }
    notifyListeners();
  }

  CardModel getRandomElement<CardModel>(List<CardModel> cards) {
    final random = new Random();
    var i = random.nextInt(cards.length);
    return cards[i];
  }

  Future<void> botTurn() async {
    await Future.delayed(const Duration(milliseconds: 500));

    List<int> envido1 = [];
    if (_envido) {
      for (var i = 0; i < players[1].cards.length - 1; i++) {
        for (var j = 1; j < players[1].cards.length; j++) {
          if (players[1].cards[i].Suit == players[1].cards[j].Suit && i != j) {
            envido1.add(players[1].cards[i].EnvidoValue +
                players[1].cards[j].EnvidoValue);
          }
        }
      }
      print(envido1.reduce(max));
      _envido = false;
      endTurn();
      return null;
    }

    var card = getRandomElement(players[1].cards);

    players[1].removeCard(card);

    players[1].addDiscards(card);

    _discards.add(card);

    _turn.actionCount += 1;

    players[1].setEnvido(false);

    await Future.delayed(const Duration(milliseconds: 500));

    endTurn();
  }
}
