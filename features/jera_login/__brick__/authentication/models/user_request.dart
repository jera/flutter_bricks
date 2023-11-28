class UserRequest {
  String name;
  String email;
  String password;

  UserRequest({required this.name, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
