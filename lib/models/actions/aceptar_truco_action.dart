import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class AceptarTrucoAction extends TurnAction {
  final model;
  final playerOwner;

  AceptarTrucoAction({
    this.model,
    this.playerOwner,
  }) : super(model: model, playerOwner: playerOwner);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Aceptar Truco"), onPressed: this.executeAction,
      // : null,
      // child: const Text("Truco!"),
    );
  }

  @override
  executeAction() {
    print("ACEPTAR TRUCO!");
    this.model.aceptarTruco(this.playerOwner);
  }
}
