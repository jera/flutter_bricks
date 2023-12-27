class RegisterRequest {
  String name;
  String email;
  String phone;
  String document;
  String password;
  String confirmPassword;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.document,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'document': document,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
