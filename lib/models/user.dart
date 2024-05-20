class User {
  final int id;
  final String name;
  final String password;

  User({required this.id, required this.name, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], password: json['password']);
  }
}
