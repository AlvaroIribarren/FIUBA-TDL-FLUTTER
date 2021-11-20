import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/card_model.dart';
import 'package:flutter_auth/models/deck_model.dart';
import 'package:flutter_auth/models/hand_model.dart';
import 'package:flutter_auth/models/player_model.dart';
import 'package:flutter_auth/models/turn_action.dart';
import 'package:flutter_auth/models/turn_model.dart';

class GameProvider with ChangeNotifier {
  /*GameProvider() {
    _service = DeckModel();
  }*/

  bool _envido;

  Turn _turn;
  // Turn get turn => _turn;

  List<PlayerModel> _players = [];
  List<PlayerModel> get players => _players;

  List<CardModel> cards;

  // List<CardModel> _discards = [];
  // List<CardModel> get discards => _discards;

  // Map<String, dynamic> gameState = {};

  void newGame(List<PlayerModel> players) {
    print("Creating a new game");
    _players = players;
    _turn = Turn(players: players, currentPlayer: players.first);
    setupBoard(players);
    notifyListeners();
  }


  initDeck() {
    var card1 = CardModel(
      image: "assets/images/c1.png",
      value: "1 COPA",
      suit: "COPA",
      envidoValue: 1,
      visible: true,
      order: getOrder(1, Suit.Cups),
    );
    var card2 = CardModel(
      image: "assets/images/c2.png",
      value: "2 COPA",
      suit: "COPA",
      envidoValue: 2,
      visible: true,
      order: getOrder(2, Suit.Cups),
    );
    var card3 = CardModel(
      image: "assets/images/c3.png",
      value: "3 COPA",
      suit: "COPA",
      envidoValue: 3,
      visible: true,
      order: getOrder(3, Suit.Cups),
    );
    var card4 = CardModel(
      image: "assets/images/c4.png",
      value: "4 COPA",
      suit: "COPA",
      envidoValue: 4,
      visible: true,
      order: getOrder(4, Suit.Cups),
    );
    var card5 = CardModel(
      image: "assets/images/c5.png",
      value: "5 COPA",
      suit: "COPA",
      envidoValue: 5,
      visible: true,
      order: getOrder(5, Suit.Cups),
    );
    var card6 = CardModel(
      image: "assets/images/c6.png",
      value: "6 COPA",
      suit: "COPA",
      envidoValue: 6,
      visible: true,
      order: getOrder(6, Suit.Cups),
    );
    var card7 = CardModel(
      image: "assets/images/c7.png",
      value: "7 COPA",
      suit: "COPA",
      envidoValue: 7,
      visible: true,
      order: getOrder(7, Suit.Cups),
    );
    var card8 = CardModel(
      image: "assets/images/c8.png",
      value: "10 COPA",
      suit: "COPA",
      envidoValue: 20,
      visible: true,
      order: getOrder(10, Suit.Cups),
    );
    var card9 = CardModel(
      image: "assets/images/c9.png",
      value: "11 COPA",
      suit: "COPA",
      envidoValue: 20,
      visible: true,
      order: getOrder(11, Suit.Cups),
    );
    var card10 = CardModel(
      image: "assets/images/c10.png",
      value: "12 COPA",
      suit: "COPA",
      envidoValue: 20,
      visible: true,
      order: getOrder(12, Suit.Cups),
    );
    var gold1 = CardModel(
      image: "assets/images/o1.png",
      value: "1 ORO",
      suit: "ORO",
      envidoValue: 1,
      visible: true,
      order: getOrder(1, Suit.Golds),
    );var gold2 = CardModel(
      image: "assets/images/o2.png",
      value: "2 ORO",
      suit: "ORO",
      envidoValue: 2,
      visible: true,
      order: getOrder(2, Suit.Golds),
    );var gold3 = CardModel(
      image: "assets/images/o3.png",
      value: "3 ORO",
      suit: "ORO",
      envidoValue: 3,
      visible: true,
      order: getOrder(3, Suit.Golds),
    );var gold4 = CardModel(
      image: "assets/images/o4.png",
      value: "4 ORO",
      suit: "ORO",
      envidoValue: 4,
      visible: true,
      order: getOrder(4, Suit.Golds),
    );var gold5 = CardModel(
      image: "assets/images/o5.png",
      value: "5 ORO",
      suit: "ORO",
      envidoValue: 5,
      visible: true,
      order: getOrder(5, Suit.Golds),
    );var gold6 = CardModel(
      image: "assets/images/o6.png",
      value: "6 ORO",
      suit: "ORO",
      envidoValue: 6,
      visible: true,
      order: getOrder(6, Suit.Golds),
    );var gold7 = CardModel(
      image: "assets/images/o7.png",
      value: "7 ORO",
      suit: "ORO",
      envidoValue: 7,
      visible: true,
      order: getOrder(7, Suit.Golds),
    );var gold8 = CardModel(
      image: "assets/images/o8.png",
      value: "10 ORO",
      suit: "ORO",
      envidoValue: 20,
      visible: true,
      order: getOrder(10, Suit.Golds),
    );var gold9 = CardModel(
      image: "assets/images/o9.png",
      value: "11 ORO",
      suit: "ORO",
      envidoValue: 20,
      visible: true,
      order: getOrder(11, Suit.Golds),
    );
    var gold10 = CardModel(
      image: "assets/images/o10.png",
      value: "12 ORO",
      suit: "ORO",
      envidoValue: 20,
      visible: true,
      order: getOrder(12, Suit.Golds),
    );
    var sword1 = CardModel(
      image: "assets/images/e1.png",
      value: "1 ESPADA",
      suit: "ESPADA",
      envidoValue: 1,
      visible: true,
      order: getOrder(1, Suit.Swords),
    );
    var sword2 = CardModel(
      image: "assets/images/e2.png",
      value: "2 ESPADA",
      suit: "ESPADA",
      envidoValue: 2,
      visible: true,
      order: getOrder(2, Suit.Swords),
    );
    var sword3 = CardModel(
      image: "assets/images/e3.png",
      value: "3 ESPADA",
      suit: "ESPADA",
      envidoValue: 3,
      visible: true,
      order: getOrder(3, Suit.Swords),
    );
    var sword4 = CardModel(
      image: "assets/images/e4.png",
      value: "4 ESPADA",
      suit: "ESPADA",
      envidoValue: 4,
      visible: true,
      order: getOrder(4, Suit.Swords),
    );
    var sword5 = CardModel(
      image: "assets/images/e5.png",
      value: "5 ESPADA",
      suit: "ESPADA",
      envidoValue: 5,
      visible: true,
      order: getOrder(5, Suit.Swords),
    );
    var sword6 = CardModel(
      image: "assets/images/e6.png",
      value: "6 ESPADA",
      suit: "ESPADA",
      envidoValue: 6,
      visible: true,
      order: getOrder(6, Suit.Swords),
    );
    var sword7 = CardModel(
      image: "assets/images/e7.png",
      value: "7 ESPADA",
      suit: "ESPADA",
      envidoValue: 7,
      visible: true,
      order: getOrder(7, Suit.Swords),
    );
    var sword8 = CardModel(
      image: "assets/images/e8.png",
      value: "10 ESPADA",
      suit: "ESPADA",
      envidoValue: 20,
      visible: true,
      order: getOrder(10, Suit.Swords),
    );
    var sword9 = CardModel(
      image: "assets/images/e9.png",
      value: "11 ESPADA",
      suit: "ESPADA",
      envidoValue: 20,
      visible: true,
      order: getOrder(11, Suit.Swords),
    );
    var sword10 = CardModel(
      image: "assets/images/e10.png",
      value: "12 ESPADA",
      suit: "ESPADA",
      envidoValue: 20,
      visible: true,
      order: getOrder(12, Suit.Swords),
    );
    var club1 = CardModel(
      image: "assets/images/b1.png",
      value: "1 BASTO",
      suit: "BASTO",
      envidoValue: 1,
      visible: true,
      order: getOrder(2, Suit.Clubs),
    );
    var club2 = CardModel(
      image: "assets/images/b2.png",
      value: "2 BASTO",
      suit: "BASTO",
      envidoValue: 2,
      visible: true,
      order: getOrder(2, Suit.Clubs),
    );
    var club3 = CardModel(
      image: "assets/images/b3.png",
      value: "3 BASTO",
      suit: "BASTO",
      envidoValue: 3,
      visible: true,
      order: getOrder(3, Suit.Clubs),
    );
    var club4 = CardModel(
      image: "assets/images/b4.png",
      value: "4 BASTO",
      suit: "BASTO",
      envidoValue: 4,
      visible: true,
      order: getOrder(4, Suit.Clubs),
    );
    var club5 = CardModel(
      image: "assets/images/b5.png",
      value: "5 BASTO",
      suit: "BASTO",
      envidoValue: 5,
      visible: true,
      order: getOrder(5, Suit.Clubs),
    );
    var club6 = CardModel(
      image: "assets/images/b6.png",
      value: "6 BASTO",
      suit: "BASTO",
      envidoValue: 6,
      visible: true,
      order: getOrder(6, Suit.Clubs),
    );
    var club7 = CardModel(
      image: "assets/images/b7.png",
      value: "7 BASTO",
      suit: "BASTO",
      envidoValue: 7,
      visible: true,
      order: getOrder(7, Suit.Clubs),
    );
    var club8 = CardModel(
      image: "assets/images/b8.png",
      value: "10 BASTO",
      suit: "BASTO",
      envidoValue: 20,
      visible: true,
      order: getOrder(10, Suit.Clubs),
    );
    var club9 = CardModel(
      image: "assets/images/b9.png",
      value: "11 BASTO",
      suit: "BASTO",
      envidoValue: 20,
      visible: true,
      order: getOrder(11, Suit.Clubs),
    );
    var club10 = CardModel(
      image: "assets/images/b10.png",
      value: "12 BASTO",
      suit: "BASTO",
      envidoValue: 20,
      visible: true,
      order: getOrder(12, Suit.Clubs),
    );

    this.cards = [card1, card2, card3, card4,card5,card6, card7,card8,card9,card10,
    gold1, gold2, gold3, gold4, gold5, gold6, gold7, gold8, gold9,gold10,
    club1, club2, club3, club4, club5, club6, club7, club8, club9, club10,
    sword1, sword2, sword3, sword4, sword5, sword6, sword7, sword8, sword9, sword10];
  }

  getOrder(int value, Suit suit){
    var order = 0;
    if((value >= 4 && value < 7) || (value >=10 && value <= 12)){
      order = value;
    } else if(value == 7 && ((suit == Suit.Cups.toString()) || (suit == Suit.Clubs.toString()))){
      order = value;
    }
    else if(value == 1 && suit != Suit.Swords.toString() && suit != Suit.Clubs.toString()){
      order = 13;
    } else if (value == 2) {
      order = 14;
    } else if (value == 3) {
      order = 15;
    } else if(value == 7 && suit == Suit.Golds.toString()){
      order = 16;
    } else if(value == 7 && suit == Suit.Golds.toString()){
      order = 17;
    } else if(value == 1 && suit == Suit.Clubs.toString()){
      order = 18;
    } else {
      order = 19;
    }
    return order;
  }

  dealCards(){
    var randomIndexCard = List<int>.generate(39, (i) => i + 1)..shuffle();
    return [[cards[randomIndexCard.removeLast()], cards[randomIndexCard.removeLast()], cards[randomIndexCard.removeLast()]],
    [cards[randomIndexCard.removeLast()], cards[randomIndexCard.removeLast()], cards[randomIndexCard.removeLast()]]];
  }

  void setupBoard(List<PlayerModel> players) {
    initDeck();
    var hands = dealCards();
    var hand1 = HandModel(cards: hands[0]);
    var hand2 = HandModel(cards: hands[1]);
    players[0].assignNewHand(hand1);
    players[1].assignNewHand(hand2);
    players[0].setEnvido(true);
    players[1].setEnvido(true);
    _envido = false;
    // _discards = [];
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

    player.discardCard(card);

    // _discards.add(card);

    _turn.actionCount += 1;

    player.setEnvido(false);

    endTurn();
  }

  bool get canEndTurn {
    return true;
    //Si no jugó una carta, no podría pasar el turno
  }

  List<TurnAction> getTurnActions() {
    return _turn.getTurnActions();
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
    // if (_envido) {
    //   for (var i = 0; i < players[1].cards.length - 1; i++) {
    //     for (var j = 1; j < players[1].cards.length; j++) {
    //       if (players[1].cards[i].Suit == players[1].cards[j].Suit && i != j) {
    //         envido1.add(players[1].cards[i].EnvidoValue +
    //             players[1].cards[j].EnvidoValue);
    //       }
    //     }
    //   }
    //   print(envido1.reduce(max));
    //   _envido = false;
    //   endTurn();
    //   return null;
    // }

    var card = getRandomElement(players[1].currentHand.cards);

    players[1].discardCard(card);

    // _discards.add(card);

    _turn.actionCount += 1;

    players[1].setEnvido(false);

    await Future.delayed(const Duration(milliseconds: 500));

    endTurn();
  }
}
