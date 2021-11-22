import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/models/card_model.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const lightLightBlue = Color(0XFFB3E5FC);

const CARD_WIDTH = 226 / 2;
const CARD_HEIGHT = 336 / 2;

String urlString = "https://truco-server-tdl.herokuapp.com";
String usersString = urlString + '/users';
final base_url = Uri.parse(urlString);
final users_url = Uri.parse(usersString);
final login_url = Uri.parse(usersString + "/login");

const OK_RESPONSE = 200;
const CREATED_OK_RESPONSE = 201;

var card1 = CardModel(
  image: "assets/images/c1.png",
  value: "1 COPA",
  suit: "COPA",
  envidoValue: 1,
  visible: true,
  order: getOrder(1, Suit.Cups),
);
var card2 = CardModel(
  image: "assets/images/c2.png",
  value: "2 COPA",
  suit: "COPA",
  envidoValue: 2,
  visible: true,
  order: getOrder(2, Suit.Cups),
);
var card3 = CardModel(
  image: "assets/images/c3.png",
  value: "3 COPA",
  suit: "COPA",
  envidoValue: 3,
  visible: true,
  order: getOrder(3, Suit.Cups),
);
var card4 = CardModel(
  image: "assets/images/c4.png",
  value: "4 COPA",
  suit: "COPA",
  envidoValue: 4,
  visible: true,
  order: getOrder(4, Suit.Cups),
);
var card5 = CardModel(
  image: "assets/images/c5.png",
  value: "5 COPA",
  suit: "COPA",
  envidoValue: 5,
  visible: true,
  order: getOrder(5, Suit.Cups),
);
var card6 = CardModel(
  image: "assets/images/c6.png",
  value: "6 COPA",
  suit: "COPA",
  envidoValue: 6,
  visible: true,
  order: getOrder(6, Suit.Cups),
);
var card7 = CardModel(
  image: "assets/images/c7.png",
  value: "7 COPA",
  suit: "COPA",
  envidoValue: 7,
  visible: true,
  order: getOrder(7, Suit.Cups),
);
var card8 = CardModel(
  image: "assets/images/c8.png",
  value: "10 COPA",
  suit: "COPA",
  envidoValue: 20,
  visible: true,
  order: getOrder(10, Suit.Cups),
);
var card9 = CardModel(
  image: "assets/images/c9.png",
  value: "11 COPA",
  suit: "COPA",
  envidoValue: 20,
  visible: true,
  order: getOrder(11, Suit.Cups),
);
var card10 = CardModel(
  image: "assets/images/c10.png",
  value: "12 COPA",
  suit: "COPA",
  envidoValue: 20,
  visible: true,
  order: getOrder(12, Suit.Cups),
);
var gold1 = CardModel(
  image: "assets/images/o1.png",
  value: "1 ORO",
  suit: "ORO",
  envidoValue: 1,
  visible: true,
  order: getOrder(1, Suit.Golds),
);
var gold2 = CardModel(
  image: "assets/images/o2.png",
  value: "2 ORO",
  suit: "ORO",
  envidoValue: 2,
  visible: true,
  order: getOrder(2, Suit.Golds),
);
var gold3 = CardModel(
  image: "assets/images/o3.png",
  value: "3 ORO",
  suit: "ORO",
  envidoValue: 3,
  visible: true,
  order: getOrder(3, Suit.Golds),
);
var gold4 = CardModel(
  image: "assets/images/o4.png",
  value: "4 ORO",
  suit: "ORO",
  envidoValue: 4,
  visible: true,
  order: getOrder(4, Suit.Golds),
);
var gold5 = CardModel(
  image: "assets/images/o5.png",
  value: "5 ORO",
  suit: "ORO",
  envidoValue: 5,
  visible: true,
  order: getOrder(5, Suit.Golds),
);
var gold6 = CardModel(
  image: "assets/images/o6.png",
  value: "6 ORO",
  suit: "ORO",
  envidoValue: 6,
  visible: true,
  order: getOrder(6, Suit.Golds),
);
var gold7 = CardModel(
  image: "assets/images/o7.png",
  value: "7 ORO",
  suit: "ORO",
  envidoValue: 7,
  visible: true,
  order: getOrder(7, Suit.Golds),
);
var gold8 = CardModel(
  image: "assets/images/o8.png",
  value: "10 ORO",
  suit: "ORO",
  envidoValue: 20,
  visible: true,
  order: getOrder(10, Suit.Golds),
);
var gold9 = CardModel(
  image: "assets/images/o9.png",
  value: "11 ORO",
  suit: "ORO",
  envidoValue: 20,
  visible: true,
  order: getOrder(11, Suit.Golds),
);
var gold10 = CardModel(
  image: "assets/images/o10.png",
  value: "12 ORO",
  suit: "ORO",
  envidoValue: 20,
  visible: true,
  order: getOrder(12, Suit.Golds),
);
var sword1 = CardModel(
  image: "assets/images/e1.png",
  value: "1 ESPADA",
  suit: "ESPADA",
  envidoValue: 1,
  visible: true,
  order: getOrder(1, Suit.Swords),
);
var sword2 = CardModel(
  image: "assets/images/e2.png",
  value: "2 ESPADA",
  suit: "ESPADA",
  envidoValue: 2,
  visible: true,
  order: getOrder(2, Suit.Swords),
);
var sword3 = CardModel(
  image: "assets/images/e3.png",
  value: "3 ESPADA",
  suit: "ESPADA",
  envidoValue: 3,
  visible: true,
  order: getOrder(3, Suit.Swords),
);
var sword4 = CardModel(
  image: "assets/images/e4.png",
  value: "4 ESPADA",
  suit: "ESPADA",
  envidoValue: 4,
  visible: true,
  order: getOrder(4, Suit.Swords),
);
var sword5 = CardModel(
  image: "assets/images/e5.png",
  value: "5 ESPADA",
  suit: "ESPADA",
  envidoValue: 5,
  visible: true,
  order: getOrder(5, Suit.Swords),
);
var sword6 = CardModel(
  image: "assets/images/e6.png",
  value: "6 ESPADA",
  suit: "ESPADA",
  envidoValue: 6,
  visible: true,
  order: getOrder(6, Suit.Swords),
);
var sword7 = CardModel(
  image: "assets/images/e7.png",
  value: "7 ESPADA",
  suit: "ESPADA",
  envidoValue: 7,
  visible: true,
  order: getOrder(7, Suit.Swords),
);
var sword8 = CardModel(
  image: "assets/images/e8.png",
  value: "10 ESPADA",
  suit: "ESPADA",
  envidoValue: 20,
  visible: true,
  order: getOrder(10, Suit.Swords),
);
var sword9 = CardModel(
  image: "assets/images/e9.png",
  value: "11 ESPADA",
  suit: "ESPADA",
  envidoValue: 20,
  visible: true,
  order: getOrder(11, Suit.Swords),
);
var sword10 = CardModel(
  image: "assets/images/e10.png",
  value: "12 ESPADA",
  suit: "ESPADA",
  envidoValue: 20,
  visible: true,
  order: getOrder(12, Suit.Swords),
);
var club1 = CardModel(
  image: "assets/images/b1.png",
  value: "1 BASTO",
  suit: "BASTO",
  envidoValue: 1,
  visible: true,
  order: getOrder(1, Suit.Clubs),
);
var club2 = CardModel(
  image: "assets/images/b2.png",
  value: "2 BASTO",
  suit: "BASTO",
  envidoValue: 2,
  visible: true,
  order: getOrder(2, Suit.Clubs),
);
var club3 = CardModel(
  image: "assets/images/b3.png",
  value: "3 BASTO",
  suit: "BASTO",
  envidoValue: 3,
  visible: true,
  order: getOrder(3, Suit.Clubs),
);
var club4 = CardModel(
  image: "assets/images/b4.png",
  value: "4 BASTO",
  suit: "BASTO",
  envidoValue: 4,
  visible: true,
  order: getOrder(4, Suit.Clubs),
);
var club5 = CardModel(
  image: "assets/images/b5.png",
  value: "5 BASTO",
  suit: "BASTO",
  envidoValue: 5,
  visible: true,
  order: getOrder(5, Suit.Clubs),
);
var club6 = CardModel(
  image: "assets/images/b6.png",
  value: "6 BASTO",
  suit: "BASTO",
  envidoValue: 6,
  visible: true,
  order: getOrder(6, Suit.Clubs),
);
var club7 = CardModel(
  image: "assets/images/b7.png",
  value: "7 BASTO",
  suit: "BASTO",
  envidoValue: 7,
  visible: true,
  order: getOrder(7, Suit.Clubs),
);
var club8 = CardModel(
  image: "assets/images/b8.png",
  value: "10 BASTO",
  suit: "BASTO",
  envidoValue: 20,
  visible: true,
  order: getOrder(10, Suit.Clubs),
);
var club9 = CardModel(
  image: "assets/images/b9.png",
  value: "11 BASTO",
  suit: "BASTO",
  envidoValue: 20,
  visible: true,
  order: getOrder(11, Suit.Clubs),
);
var club10 = CardModel(
  image: "assets/images/b10.png",
  value: "12 BASTO",
  suit: "BASTO",
  envidoValue: 20,
  visible: true,
  order: getOrder(12, Suit.Clubs),
);

var CARDS = [
  card1,
  card2,
  card3,
  card4,
  card5,
  card6,
  card7,
  card8,
  card9,
  card10,
  gold1,
  gold2,
  gold3,
  gold4,
  gold5,
  gold6,
  gold7,
  gold8,
  gold9,
  gold10,
  club1,
  club2,
  club3,
  club4,
  club5,
  club6,
  club7,
  club8,
  club9,
  club10,
  sword1,
  sword2,
  sword3,
  sword4,
  sword5,
  sword6,
  sword7,
  sword8,
  sword9,
  sword10
];

getOrder(int value, Suit suit) {
  var order = 0;
  if ((value >= 4 && value < 7) || (value >= 10 && value <= 12)) {
    order = value;
  } else if (value == 7 && ((suit == Suit.Cups) || (suit == Suit.Clubs))) {
    order = value;
  } else if (value == 1 && suit != Suit.Swords && suit != Suit.Clubs) {
    order = 13;
  } else if (value == 2) {
    order = 14;
  } else if (value == 3) {
    order = 15;
  } else if (value == 7 && suit == Suit.Golds) {
    order = 16;
  } else if (value == 7 && suit == Suit.Swords) {
    order = 17;
  } else if (value == 1 && suit == Suit.Clubs) {
    order = 18;
  } else {
    order = 19;
  }
  return order;
}
