
import 'app_user.dart';
class AuthResponse {
  final String message;
  final AppUser user;
  final String token;

  AuthResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  // Convert JSON to Dart Object
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'] ?? '',
      user: AppUser.fromJson(json['user'] ?? {}),
      token: json['token'] ?? '',
    );
  }

  // Convert Dart Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user.toJson(),
      'token': token,
    };
  }
}

