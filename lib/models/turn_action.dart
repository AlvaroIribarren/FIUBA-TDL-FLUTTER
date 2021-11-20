import 'package:flutter/widgets.dart';
import 'package:flutter_auth/models/player_model.dart';
import 'package:flutter_auth/services/game_provider.dart';

abstract class TurnAction extends StatelessWidget {
  final PlayerModel playerOwner;
  final GameProvider model;

  const TurnAction({this.model, this.playerOwner});

  executeAction();
}
