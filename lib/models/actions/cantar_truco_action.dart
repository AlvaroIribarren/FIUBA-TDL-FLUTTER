import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'turn_action.dart';

class CantarTrucoAction extends TurnAction {
  final model;
  final playerOwner;
  final playerx = new AudioCache(fixedPlayer: AudioPlayer());
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

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
    if (this.playerOwner.isBot) {
      playerx.fixedPlayer.stop();
      playerx.play('audios/cantar_truco.mp3');
      // audioPlayer.play('/assets/audios/cantar_truco.mp3', isLocal: true);
    }
    // <otro jugador acepta o no>
  }
}
