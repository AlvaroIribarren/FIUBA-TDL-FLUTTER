import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class AceptarTrucoAction extends TurnAction {
  final model;
  final playerOwner;
  final playerx = new AudioCache(fixedPlayer: AudioPlayer());
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

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
    if (this.playerOwner.isBot) {
      playerx.fixedPlayer.stop();
      playerx.play('audios/aceptar_truco.mp3');
      // audioPlayer.stop();
      // audioPlayer.play('/assets/audios/aceptar_truco.mp3', isLocal: true);
    }
    this.model.aceptarTruco(this.playerOwner);
  }
}
