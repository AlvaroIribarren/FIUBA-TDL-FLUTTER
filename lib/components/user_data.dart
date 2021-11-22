import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/api/UserSchema.dart';
import 'package:truco_argentino_hardcoders/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends StatefulWidget {
  const UserData({Key key}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  UserSchema user;
  Api api = Api();

  Future<UserSchema> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    return api.getUserById(prefs.getInt('userId') ?? 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(child: Center(child: Text('Cargando...')));
          } else {
            return Container(
              child: Text(
                "Hola, ${snapshot.data.email} presiona el boton superior \n para comenzar un nuevo juego",
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      )),
    );
  }
}
