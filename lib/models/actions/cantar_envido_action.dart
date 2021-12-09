import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class CantarEnvidoAction extends TurnAction {
  final model;
  final playerOwner;

  CantarEnvidoAction({
    this.model,
    this.playerOwner,
  }) : super(model: model, playerOwner: playerOwner);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Envido!"), onPressed: this.executeAction,
      // : null,
      // child: const Text("Envido!"),
    );
  }

  @override
  executeAction() {
    print("ENVIDO!");
    this.model.cantarEnvido(this.playerOwner);
    if(this.playerOwner.isBot) {
      return Container(
        color: Colors.black,
      );
    }

    // <otro jugador acepta o no>
  }
}
