import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/players_hand.dart';
import 'package:flutter_auth/models/deck_model.dart';

class GameBoard extends StatefulWidget {

  const GameBoard({
    Key key,
  }) : super(key: key);

  @override
  State<GameBoard> createState()  => _GameBoardState();

}

class _GameBoardState extends State<GameBoard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(29),
      ),
      child: PlayersHandContainer(),
    );
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

}
