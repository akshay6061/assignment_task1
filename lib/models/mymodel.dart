class User {
  final String username;

  User({required this.username, required String token, required String refreshToken, required String email});

  String? get email => null;
}