import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/models/turn_action.dart';

class EnvidoAction extends TurnAction {
  final players;

  EnvidoAction({
    this.players,
  }) : super(players: players);

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
    // TODO: implement executeAction
    // throw UnimplementedError();
    print("ENVIDO!");
  }
}
