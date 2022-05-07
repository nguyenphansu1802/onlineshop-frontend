import '../models/Account.dart';
import '../models/User.dart';

abstract class IAuthService {
  Future<UserModel?> signIn({
    required String username,
    required String password,
  });

  Future<UserModel?> signIn2({
    required String username,
    required String password,
  });

  @override
  Future<AccountModel?> signUp({
    required UserModel user,
    required AccountModel account,

  });

  @override
  Future<AccountModel?> signUp3({
    required String password,
    required String name,
    required String gender,
    required DateTime dateofbirth,
    required String email,
  });
}
