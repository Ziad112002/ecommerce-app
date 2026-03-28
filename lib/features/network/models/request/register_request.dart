
class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  // Convert JSON to Dart Object
  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      rePassword: json['rePassword'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  // Convert Dart Object to JSON (for sending to API)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'phone': phone,
    };
  }
}