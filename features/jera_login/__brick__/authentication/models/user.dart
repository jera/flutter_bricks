import 'dart:convert';

class User {
  String name;
  String email;
  String token;

  User.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        token = map['token'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
    };
  }

  static String serialize(User model) => json.encode(model.toMap());

  static User deserialize(String? json) => User.fromMap(jsonDecode(json ?? ''));
}
