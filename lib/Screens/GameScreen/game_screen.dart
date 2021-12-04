import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/Screens/Leaderboard/leaderboard_screen.dart';
import 'package:truco_argentino_hardcoders/components/gameboard.dart';
import 'package:truco_argentino_hardcoders/components/user_data.dart';
import 'package:truco_argentino_hardcoders/models/player_model.dart';
import 'package:truco_argentino_hardcoders/services/game_provider.dart';
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
          title: const Text("Truco"),
        ),
        body: Padding(
          padding: EdgeInsets.all(50),
          child:  Column(
            children: <Widget>[
              InkWell(
                onTap: () async{
                  final players = [
                    PlayerModel(name: "Fackz", isHuman: true),
                    PlayerModel(name: "Franco", isHuman: false),
                  ];
                  _gameProvider.newGame(players);
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext  context) =>
                          ChangeNotifierProvider(
                            create: (context) => _gameProvider,
                            builder: (context, child) => GameBoard(),
                          ),
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightGreen,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 125,
                        child: Center(
                          child: Text(
                            "Nuevo \nJuego",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 125,
                        child: Image.asset(
                          "assets/images/cartas-espadas.png",
                          width: 50,
                          height: 100,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
      InkWell(
        onTap: () async{
          final players = [
            PlayerModel(name: "Fackz", isHuman: true),
            PlayerModel(name: "Franco", isHuman: false),
          ];
          _gameProvider.newGame(players);
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext  context) =>
                  ChangeNotifierProvider(
                    create: (context) => _gameProvider,
                    builder: (context, child) => Leaderboard(),

                  ),
            ),
          );
        },
        child:
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                height: 150,
                width: 250,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 125,
                      child: Center(
                        child: Text(
                          "Lider \nBoard",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                        height: 150,
                        width: 125,
                        child: const Icon(
                          Icons.leaderboard,
                          size: 75,
                        ))
                  ],
                ),
              ),
            )],
          ),
        ));
  }
}
