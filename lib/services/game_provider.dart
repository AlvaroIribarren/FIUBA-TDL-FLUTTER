import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/models/annotator.dart';
import 'package:truco_argentino_hardcoders/models/card_model.dart';
import 'package:truco_argentino_hardcoders/models/hand_model.dart';
import 'package:truco_argentino_hardcoders/models/player_model.dart';
import 'package:truco_argentino_hardcoders/models/actions/turn_action.dart';
import 'package:truco_argentino_hardcoders/models/turn_model.dart';

import '../constants.dart';

class GameProvider with ChangeNotifier {
  /*GameProvider() {
    _service = DeckModel();
  }*/

  bool envido = false;

  Annotator annotator;

  Turn _turn;
  // Turn get turn => _turn;

  List<PlayerModel> _players = [];
  List<PlayerModel> get players => _players;

  List<CardModel> cards;

  int roundNumber = 0;

  void newGame(List<PlayerModel> players) {
    roundNumber = 0;
    print("Creating a new game");
    _players = players;
    _turn = Turn(players: players, currentPlayer: players.first);
    setupBoard(players);
    annotator = new Annotator(
      playerHumanName: players[0].name,
      playerBotName: players[1].name,
    );
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

    players[0].resetDesafios();
    players[1].resetDesafios();
  }

  cantarEnvido(PlayerModel player) {
    _turn.cantarEnvido(player);
    _turn.swapCurrentPlayer();
    if (_turn.currentPlayer.isBot) {
      botActionResponse();
    }
    notifyListeners();
  }

  rechazarEnvido(PlayerModel player) {
    _turn.cantarEnvido(player);
    annotator.addRoundPointsToOtherPlayer(player, 1);
    _turn.swapCurrentPlayer();
    _turn.desbloquearManos();
    if (_turn.currentPlayer.isBot) {
      botPlayCard();
    }
    notifyListeners();
  }

  aceptarEnvido(PlayerModel player) {
    envido = true;
    _turn.cantarEnvido(player);
    PlayerModel winner = _turn.findWinnerEnvidoPlayer();
    annotator.addRoundPoints(winner, 2);
    _turn.swapCurrentPlayer();
    _turn.desbloquearManos();
    if (_turn.currentPlayer.isBot) {
      botPlayCard();
    }
    notifyListeners();
  }

  cantarTruco(PlayerModel player) {
    _turn.cantarTruco(player);
    _turn.swapCurrentPlayer();
    if (_turn.currentPlayer.isBot) {
      botActionResponse();
    }
    notifyListeners();
  }

  rechazarTruco(PlayerModel player) async {
    annotator.addRoundPointsToOtherPlayer(player, 1);
    _turn.swapCurrentPlayer();
    // reset round
    await endRound();
    _turn.desbloquearManos();
    if (_turn.currentPlayer.isBot) {
      botTurn();
    }
    notifyListeners();
  }

  aceptarTruco(PlayerModel player) {
    _turn.cantarTruco(player);
    _turn.swapCurrentPlayer();
    _turn.desbloquearManos();
    if (_turn.currentPlayer.isBot) {
      botPlayCard();
    }
    notifyListeners();
  }

  _sumarPuntosSiHuboTruco() {
    if (_turn.huboTruco()) {
      PlayerModel winner = _turn.findWinnerTrucoPlayer(
        annotator.roundPointsBot,
        annotator.roundPointsPlayer,
      );
      annotator.addRoundPoints(winner, 1);
    }
    ;
    // TODO: si huboTruco, sumar +2 a quien haya ganado la ronda
  }

  Future<void> playCard({
    PlayerModel player,
    CardModel card,
  }) async {
    if (player != _turn.currentPlayer || player.tieneManoBloqueada()) return;
    print("*** JUEGA ${player.name}");
    player.discardCard(card);
    _turn.playsCount += 1;
    endTurn();
    // endPlay();
  }

  List<TurnAction> _getTurnActions() {
    return _turn.getTurnActions(this);
  }

  List<TurnAction> getUITurnActions() {
    if (_turn.currentPlayer.isHuman) {
      return _turn.getTurnActions(this);
    }

    return [];
  }

  Future<void> endTurn() async {
    notifyListeners();

    if (envido) {
      await Future.delayed(const Duration(milliseconds: 1500));
      envido = false;
    }
    // print("fin de turno/jugada");
    if (_turn.reachedEndOfTurn()) {
      // print("final de turno. currplayer: ${_turn.currentPlayer.name}");
      var perdedor = _turn.getLoserPlayer();
      _turn.asignarJugadorActual(perdedor);
      annotator.addPointsPerTurn(_turn.otherPlayer, 1);
    }

    print("player points: ${annotator.turnPointsPlayer}");
    print("bot points: ${annotator.turnPointsBot}");

    if (annotator.endRound()) {
      await endRound();
    } else {
      _turn.nextTurn();
    }

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

  Future<void> botActionResponse() async {
    assert(_turn.currentPlayer == players[1]);

    await Future.delayed(const Duration(milliseconds: 500));
    List<TurnAction> possibleActions = _getTurnActions();
    print("% Bot debe responder. Opciones: $possibleActions");

    // TODO: tomar decision logica...
    final random = new Random();
    int i = random.nextInt(1);
    possibleActions[i].executeAction();
  }

  Future<void> botTurn() async {
    await Future.delayed(const Duration(milliseconds: 500));

    List<TurnAction> possibleActions = _getTurnActions();
    print(possibleActions);

    // TODO: cambiar por random, NO por length != 0
    if (possibleActions.length != 0) {
      possibleActions[0].executeAction();
    } else {
      botPlayCard();
    }
  }

  Future<void> botPlayCard() async {
    await Future.delayed(const Duration(milliseconds: 500));
    var card = getRandomElement(players[1].currentHand.cards);
    playCard(player: players[1], card: card);
  }

  Future<void> endRound() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!annotator.endGame()) {
      _sumarPuntosSiHuboTruco();
      // siguiente ronda
      setupBoard(players);
      roundNumber += 1;
      print("-- Valor de roundNumber: $roundNumber");
      _turn.swapPlayerForFirstTurn(
          roundNumber); // para que ahora arranque el otro
      annotator.newRound();
      print("============== TERMINO RONDA");
      notifyListeners();
    } else {
      print("${annotator.getWinnersName} Gana la partida!");
    }
  }

  // TODO: BORRAR
  String getCurrentPlayerName() {
    return _turn.currentPlayer.name;
  }

  irseAlMazo() {
    annotator.addRoundPointsToOtherPlayer(players[0], 1);
    _turn.swapCurrentPlayer();
    // reset round
    endRound();
    _turn.desbloquearManos();
    if (_turn.currentPlayer.isBot) {
      botTurn();
    }
    notifyListeners();
  }
}
