class UserSchema {
  String email;
  String password;
  int id;
  int points;

  UserSchema({this.email, this.password, this.id});

  UserSchema.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
    points = json['points'];
  }

  UserSchema.createError() {
    email = '';
    password = '';
    id = 0;
    points = 0;
  }
}
