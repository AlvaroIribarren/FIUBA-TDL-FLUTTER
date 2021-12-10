import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class IrseAlMazoAction extends TurnAction {
  final model;
  final playerOwner;

  IrseAlMazoAction({
    this.model,
    this.playerOwner,
  }) : super(model: model, playerOwner: playerOwner);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Irse al mazo"),
      onPressed: this.executeAction,
    );
  }

  @override
  executeAction() {
    print("ME FUI AL MAZO");
    this.model.irseAlMazo();
  }
}
