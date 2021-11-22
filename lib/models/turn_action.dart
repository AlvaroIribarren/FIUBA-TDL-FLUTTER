import 'package:flutter/widgets.dart';
import 'package:truco_argentino_hardcoders/models/player_model.dart';
import 'package:truco_argentino_hardcoders/services/game_provider.dart';

abstract class TurnAction extends StatelessWidget {
  final PlayerModel playerOwner;
  final GameProvider model;

  const TurnAction({this.model, this.playerOwner});

  executeAction();
}
