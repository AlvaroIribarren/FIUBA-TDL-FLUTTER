import 'package:flutter/widgets.dart';
import 'package:flutter_auth/models/player_model.dart';

abstract class TurnAction extends StatelessWidget {
  final List<PlayerModel> players;

  const TurnAction({this.players});

  executeAction();
}
