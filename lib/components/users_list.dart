import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/api/UserSchema.dart';
import 'package:flutter_auth/api/api.dart';

class UsersList extends StatefulWidget {
  List<UserSchema> users;

  UsersList(List<UserSchema> users) : this.users = users {
    //Sort list, most points first
    users.sort((a, b) => b.points.compareTo(a.points));
  }

  @override
  _UsersListState createState() => _UsersListState(this.users);
}

class _UsersListState extends State<UsersList> {
  List<UserSchema> users;
  Api api = Api();

  _UsersListState(List<UserSchema> users) : this.users = users;

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(20.0),
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(users[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildRow(UserSchema user) {
    return ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(
          user.email,
          style: TextStyle(fontSize: 18.0),
        ),
        trailing: Text(user.points.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: Center(child: _buildList()),
    );
  }
}
