import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/annotator.dart';
import 'package:flutter_auth/constants.dart';
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

  Annotator annotator;

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
    annotator = new Annotator();
    notifyListeners();
  }

  initDeck() {
    this.cards = CARDS;
  }

  dealCards() {
    var randomIndexCard = List<int>.generate(39, (i) => i + 1)..shuffle();
    return [
      [
        cards[randomIndexCard.removeLast()],
        cards[randomIndexCard.removeLast()],
        cards[randomIndexCard.removeLast()]
      ],
      [
        cards[randomIndexCard.removeLast()],
        cards[randomIndexCard.removeLast()],
        cards[randomIndexCard.removeLast()]
      ]
    ];
  }

  void setupBoard(List<PlayerModel> players) {
    initDeck();
    var hands = dealCards();
    var hand1 = HandModel(cards: hands[0]);
    var hand2 = HandModel(cards: hands[1]);
    players[0].assignNewHand(hand1);
    players[1].assignNewHand(hand2);
    _turn = Turn(players: players, currentPlayer: players.first);
    // players[0].setEnvido(true);
    // players[1].setEnvido(true);
    _envido = false;
    // _discards = [];
  }

  bool canPlayCard(CardModel card) {
    return true;
  }

  bool canEnvido(PlayerModel player) {
    // return player.getEnvido;
  }

  cantarEnvido(PlayerModel player) {
    _turn.seCantoEnvido(player);
  }

  void envido(PlayerModel player) {
    print("Envido gato!");
    // player.setEnvido(false);
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

    _turn.playsCount += 1;

    // player.setEnvido(false);

    endTurn();
    // endPlay();
  }

  bool get canEndTurn {
    return true;
    //Si no jugó una carta, no podría pasar el turno
  }

  List<TurnAction> getTurnActions() {
    return _turn.getTurnActions(this);
  }

  void endTurn() {
    notifyListeners();

    print("fin de turno/jugada");
    if (_turn.reachedEndOfTurn()) {
      print("final de turno. currplayer: ${_turn.currentPlayer.name}");
      var perdedor = _turn.getLoserPlayer();
      _turn.asignarJugadorActual(perdedor);
      annotator.addPointsPerTurn(_turn.otherPlayer, 1);
      print(
          "final de turno, cambio actual. currplayer: ${_turn.currentPlayer.name}");
    }

    print("player points: ${annotator.turnPointsPlayer}");
    print("bot points: ${annotator.turnPointsBot}");

    if (annotator.endRound()) {
      return endRound();
    }

    _turn.nextTurn();

    print("ahora va a jugar currplayer: ${_turn.currentPlayer.name}");

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

    List<TurnAction> possibleActions = getTurnActions();
    print(possibleActions);

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

    _turn.playsCount += 1;

    // players[1].setEnvido(false);

    await Future.delayed(const Duration(milliseconds: 500));

    endTurn();
  }

  void endRound() {
    print("player round points: ${annotator.roundPointsPlayer}");
    print("bot round points: ${annotator.roundPointsBot}");

    setupBoard(players);
    annotator.newRound();
    notifyListeners();
  }
}
