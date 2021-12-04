import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:truco_argentino_hardcoders/api/UserSchema.dart';
import 'package:truco_argentino_hardcoders/api/api.dart';
import 'package:truco_argentino_hardcoders/components/common/users_list.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key key}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  Api api = Api();

  Future<List<UserSchema>> fetchData() async {
    return await api.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(child: Center(child: Text('Loading')));
          } else {
            return Container(child: UsersList(snapshot.data));
          }
        },
      )),
    );
  }
}
