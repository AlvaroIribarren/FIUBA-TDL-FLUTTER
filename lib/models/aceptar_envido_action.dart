import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/models/turn_action.dart';

class AceptarEnvidoAction extends TurnAction {
  final model;
  final playerOwner;

  AceptarEnvidoAction({
    this.model,
    this.playerOwner,
  }) : super(model: model, playerOwner: playerOwner);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Aceptar Envido"), onPressed: this.executeAction,
      // : null,
      // child: const Text("Envido!"),
    );
  }

  @override
  executeAction() {
    print("ACEPTAR ENVIDO!");
    // this.model.cantarEnvido(this.playerOwner);
    // <otro jugador acepta o no>
  }
}
