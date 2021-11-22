import 'dart:convert';

import 'package:truco_argentino_hardcoders/api/LoginResponse.dart';
import 'package:truco_argentino_hardcoders/api/UserSchema.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class Api {
  Api();

  Future<List<UserSchema>> getUsers() async {
    var response = await http.read(users_url);
    List<UserSchema> users = [];

    var decoded = json.decode(response);
    var values = decoded["items"];

    for (var item in values) {
      UserSchema actualUser = UserSchema.fromJson(item);
      users.add(actualUser);
    }

    return users;
  }

  Future<UserSchema> postNewUser(email, pass) async {
    var response =
        await http.post(users_url, body: {'email': email, 'pass': pass});
    if (response.statusCode == OK_RESPONSE ||
        response.statusCode == CREATED_OK_RESPONSE) {
      UserSchema res = UserSchema.fromJson(json.decode(response.body));
      //Save id to sort of localstorage
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('userId', res.id);
      return res;
    } else {
      return UserSchema.createError();
    }
  }

  Future<UserSchema> getUserById(int id) async {
    final userById = Uri.parse(usersString + '/' + id.toString());
    var response = await http.get(userById);
    if (response.statusCode == OK_RESPONSE ||
        response.statusCode == CREATED_OK_RESPONSE) {
      UserSchema res = UserSchema.fromJson(json.decode(response.body));
      return res;
    } else {
      return UserSchema.createError();
    }
  }

  Future<LoginResponse> login(email, pass) async {
    var response =
        await http.post(login_url, body: {'email': email, 'pass': pass});

    if (response.statusCode == CREATED_OK_RESPONSE) {
      LoginResponse res = LoginResponse.fromJson(json.decode(response.body));
      //Save email to sort of localstorage
      if (res.logged) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('userId', res.user.id);
        return res;
      }
    }
  }

  void addPointsToUser(userId, pointsToBeAdded) async {
    UserSchema user = await getUserById(userId);
    final userById = Uri.parse(usersString + '/' + userId.toString());

    user.points += pointsToBeAdded;
    var response =
        await http.patch(userById, body: {"points": user.points.toString()});
    print(response);
  }
}
