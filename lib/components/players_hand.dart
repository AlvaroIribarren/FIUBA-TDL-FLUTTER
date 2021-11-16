import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/card_model.dart';

class PlayersHandContainer extends StatelessWidget {
  final Widget child;
  const PlayersHandContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: CardModel(
              image: "1 ESPADA",
              suit: "espada",
              value: 1,
              child: Text("1 espada"),
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: CardModel(
              image: "7 ESPADA",
              suit: "espada",
              value: 7,
              child: Text("7 espada"),
            )),
        Align(
            alignment: Alignment.bottomRight,
            child: CardModel(
              image: "6 ESPADA",
              suit: "espada",
              value: 6,
              child: Text("6 espada"),
            )),
      ],
    );
  }
}
