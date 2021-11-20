import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/gameboard.dart';
import 'package:flutter_auth/models/player_model.dart';
import 'package:flutter_auth/services/game_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameProvider _gameProvider; //late final
  @override
  void initState() {
    _gameProvider = Provider.of<GameProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Truco Game"),
        actions: [
          TextButton(
            onPressed: () {
              final players = [
                PlayerModel(name: "Fackz", isHuman: true),
                PlayerModel(name: "Franco", isHuman: false),
              ];
              _gameProvider.newGame(players);
            },
            child: Text(
              "New Game",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: const GameBoard(),
    );
  }
}
