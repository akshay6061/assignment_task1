import 'package:assignment_task1/models/mymodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<User?> signIn(String username, String password) async {
    // Perform authentication, get user information, and store in SharedPreferences
    // Replace the following line with your actual authentication logic
    final user = User(username: username, email: 'user@example.com', token: '', refreshToken: '');

    // Save user information in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', user.username);
    prefs.setString('email', user.email.toString());

    return user;
  }

  Future<void> signOut() async {
    // Clear user information from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('email');
  }

  Future<User?> getUser() async {
    // Retrieve user information from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final email = prefs.getString('email');

    if (username != null && email != null) {
      return User(username: username, email: email, token: '', refreshToken: '');
    }

    return null;
  }

  getAccessToken() {}
}
