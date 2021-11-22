import 'dart:convert';

import 'package:truco_argentino_hardcoders/api/LoginResponse.dart';
import 'package:truco_argentino_hardcoders/api/UserSchema.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class Api {
  Api();

  void getUsers() async {
    print(await http.read(users_url));
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
}
