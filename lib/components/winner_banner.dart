import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WinnerBanner extends StatelessWidget {
  final String winnersName;

  const WinnerBanner({
    Key key,
    this.winnersName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("$winnersName Gana la partida!"),
      content: Text("Apretá \"Nuevo Juego\" para empezar otra partida"),
      /*actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],*/
    );
  }
}
