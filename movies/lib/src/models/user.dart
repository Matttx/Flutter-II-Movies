class User {
  String username;
  String email;

  User({this.username = "", this.email = ""});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['result'][0]['username'],
        email: json['result'][0]['email']);
  }
}
