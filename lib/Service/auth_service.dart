import '../models/user.dart';

abstract class IAuthService {
  Future<UserModel?> signIn({
    required String username,
    required String password,
  });

  Future<UserModel?> signIn2({
    required String username,
    required String password,
  });
  Future<String> signUp({
    required String password,
    required String name,
    required String gender,
    required DateTime dateofbirth,
    required String email,
  });
}
