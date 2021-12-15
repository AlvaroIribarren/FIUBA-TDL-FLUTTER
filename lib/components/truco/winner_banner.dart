import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/services/game_provider.dart';

class WinnerBanner extends StatelessWidget {
  final String winnersName;
  final GameProvider model;

  const WinnerBanner({
    Key key,
    this.winnersName,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        child: Text("$winnersName Gana la partida!"),
      ),
      content: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text("Apretá "),
                  TextButton(
                    onPressed: () {
                      model.newGame(model.players);
                    },
                    child: Text("Nuevo Juego"),
                  ),
                ],
              ),
              Text("para empezar otra partida"),
            ],
          ),
        ],
      ),
    );
  }
}
