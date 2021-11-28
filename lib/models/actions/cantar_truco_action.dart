import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class CantarTrucoAction extends TurnAction {
  final model;
  final playerOwner;

  CantarTrucoAction({
    this.model,
    this.playerOwner,
  }) : super(model: model, playerOwner: playerOwner);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Truco!"),
      onPressed: this.executeAction,
    );
  }

  @override
  executeAction() {
    print("TRUCO!");
    this.model.cantarTruco(this.playerOwner);
    // <otro jugador acepta o no>
  }
}
