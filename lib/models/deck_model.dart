import 'package:truco_argentino_hardcoders/models/card_model.dart';
import "dart:math";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckModel {
  final String deck_id;
  final bool shuffled;
  final int remaining;
  static List<CardModel> cards = [];

  const DeckModel({this.deck_id, this.shuffled, this.remaining});
}
