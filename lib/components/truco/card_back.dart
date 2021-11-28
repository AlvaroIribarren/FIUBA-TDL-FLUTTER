import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/constants.dart';

class CardBack extends StatelessWidget {
  final double size;
  final Widget child;

  const CardBack({
    Key key,
    this.size = 1,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/r0.png",
        width: CARD_WIDTH * size, height: CARD_HEIGHT * size);
  }
}
