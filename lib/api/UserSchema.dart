class UserSchema {
  String email;
  String password;
  int id;

  UserSchema({this.email, this.password, this.id});

  UserSchema.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }

  UserSchema.createError() {
    email = '';
    password = '';
    id = 0;
  }
}
