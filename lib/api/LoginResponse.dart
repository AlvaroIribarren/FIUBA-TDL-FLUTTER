class UserLoginResponse {
  int id;
  String email;
  String password;

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  UserLoginResponse.createError() {
    id = 0;
    email = "";
    password = "";
  }
}

class LoginResponse {
  UserLoginResponse user;
  bool logged;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = UserLoginResponse.fromJson(json['user']);
    logged = json['logged'];
  }

  LoginResponse.createError() {
    user = UserLoginResponse.createError();
    logged = false;
  }
}
