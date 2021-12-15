import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';
import 'package:audioplayers/audioplayers.dart';

class AceptarEnvidoAction extends TurnAction {
  final model;
  final playerOwner;
  final playerx = new AudioCache(fixedPlayer: AudioPlayer());
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  AceptarEnvidoAction({
    this.model,
    this.playerOwner,
  }) : super(model: model, playerOwner: playerOwner);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Aceptar Envido"), onPressed:
        this.executeAction,
      // : null,
      // child: const Text("Envido!"),
    );
  }

  @override
  executeAction() {
    print("ACEPTAR ENVIDO!");
    if (this.playerOwner.isBot) {
      playerx.fixedPlayer.stop();
      playerx.play('audios/aceptar_envido.mp3');
      // audioPlayer.stop();
      // audioPlayer.play(
      //   '/assets/audios/aceptar_envido.mp3',
      //   isLocal: true,
      //   stayAwake: false,
      // );
    }
    this.model.aceptarEnvido(this.playerOwner);
  }
}
