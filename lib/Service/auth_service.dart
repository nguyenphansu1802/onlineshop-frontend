import '../models/user.dart';

abstract class IAuthService {
  Future<UserModel?> signIn({
    required String username,
    required String password,
  });
  Future<String> signUp({
    required String username,
    required String email,
    required String password,
  });
  Future<UserModel?> signIn2({
    required String username,
    required String password,
  });
}
