import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class RechazarTrucoAction extends TurnAction {
  final model;
  final playerOwner;

  RechazarTrucoAction({
    this.model,
    this.playerOwner,
  }) : super(model: model, playerOwner: playerOwner);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Rechazar Truco"), onPressed: this.executeAction,
      // : null,
      // child: const Text("Envido!"),
    );
  }

  @override
  executeAction() {
    print("RECHAZAR TRUCO!");
    this.model.rechazarTruco(this.playerOwner);
  }
}
