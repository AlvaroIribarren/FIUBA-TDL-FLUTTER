import 'package:flutter/material.dart';

class DrawModel {
  final int remaining;
  final List<Card> cards;

  DrawModel({
    this.remaining,
    this.cards = const [],
  });
}
