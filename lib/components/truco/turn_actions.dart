import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/models/card_model.dart';
import 'package:truco_argentino_hardcoders/models/actions/turn_action.dart';

class TurnActionsContainer extends StatelessWidget {
  final CardModel card;
  final double size;
  final bool visible;
  final Function(CardModel) onPlayCard;
  final List<TurnAction> actions;

  const TurnActionsContainer({
    Key key,
    this.card,
    this.size = 1,
    this.visible = false,
    this.onPlayCard,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.bottomRight,
        child: Column(
          children: actions
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: e,
                ),
              )
              .toList(),
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
    );
  }
}
