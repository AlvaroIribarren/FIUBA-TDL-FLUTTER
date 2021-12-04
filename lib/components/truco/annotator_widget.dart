import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/models/annotator.dart';

class AnnotatorWidget extends StatelessWidget {
  final Annotator annotator;

  const AnnotatorWidget({Key key, this.annotator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 100,
        width: 100,
        child: GridView.count(
          // shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(8),
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              // padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(annotator.playerHumanName),
              ),
              color: Colors.teal[400],
            ),
            Container(
              // padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(annotator.playerBotName),
              ),
              color: Colors.teal[300],
            ),
            Container(
              // padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(annotator.roundPointsPlayer.toString()),
              ),
              color: Colors.teal[100],
            ),
            Container(
              // padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(annotator.roundPointsBot.toString()),
              ),
              color: Colors.teal[50],
            ),
          ],
        ),
      ),
    );
  }
}
