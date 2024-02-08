import 'package:assignment_task1/models/mymodel.dart';
import 'package:assignment_task1/services/authServices.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider<AuthService>((ref) => AuthService());

final userProvider = FutureProvider<User?>((ref) async {
  final auth = ref.read(authProvider);
  final token = await auth.getAccessToken();

  if (token != null) {
    return User(username: 'example_user', token: '', refreshToken: '', email: '');
  }

  return null;
});

