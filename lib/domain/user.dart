class User {
  late String username;
  late String password;

  User(this.username, this.password);

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
