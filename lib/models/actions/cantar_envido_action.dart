import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class CantarEnvidoAction extends TurnAction {
  final model;
  final playerOwner;
  final playerx = new AudioCache(fixedPlayer: AudioPlayer());
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

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
    if (this.playerOwner.isBot) {
      playerx.fixedPlayer.stop();
      playerx.play('audios/cantar_envido.mp3');
      // audioPlayer.play('/assets/cantar_envido.mp3', isLocal: true);
      return Container(
        color: Colors.black,
      );
    }

    // <otro jugador acepta o no>
  }
}
