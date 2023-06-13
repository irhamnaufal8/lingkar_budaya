class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;

  User({this.id, this.name, this.username, this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
