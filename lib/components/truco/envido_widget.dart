import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/models/annotator.dart';
import 'package:truco_argentino_hardcoders/models/player_model.dart';
import 'package:truco_argentino_hardcoders/services/game_provider.dart';

class EnvidoWidget extends StatelessWidget {
  final GameProvider model;

  const EnvidoWidget({Key key, this.model}) : super(key: key);

  PlayerModel ganador(GameProvider model) {
    if (model.players[0].currentHand.winsEnvido(model.players[1].currentHand)) {
      return model.players[0];
    }
    return model.players[1];
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: model.envido,
        child: Center(
            child: Container(
                color: Colors.white,
                height: 300,
                width: 150,
                child: SizedBox(
                  height: 150,
                  width: 100,
                  child: GridView.count(
                    // shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(8),
                    // crossAxisSpacing: 10,
                    // mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        // padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Jugador",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: Colors.teal[400],
                      ),
                      Container(
                        // padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Tantos",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        color: Colors.teal[300],
                      ),
                      Container(
                        // padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            model.players[0].name,
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        color: Colors.teal[100],
                      ),
                      Container(
                        // padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            model.players[0].currentHand
                                .valorDeEnvido()
                                .toString(),
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        color: Colors.teal[50],
                      ),
                      Container(
                        // padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            model.players[1].name,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        color: Colors.teal[100],
                      ),
                      Container(
                        // padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            model.players[1].currentHand
                                .valorDeEnvido()
                                .toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        color: Colors.teal[50],
                      ),
                      Center(
                        child: Text(
                          "GANA: \n" + this.ganador(model).name,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                        ,
                      ),
                  ]
                )))));
  }
}
