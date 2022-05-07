import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:online_shop/api/http_client.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Account.dart';
import '../models/User.dart';
import 'auth_service.dart';

class AuthServiceImpl implements IAuthService {
  final SharedPreferences sharedPreferences;
  final HttpClient httpClient;

  AuthServiceImpl({
    required this.httpClient,
    required this.sharedPreferences,
  });

  @override
  Future<UserModel?> signIn({
    required String username,
    required String password,
  }) async {
    String body = jsonEncode({
      "userName": username,
      "password": password,
    });

    Response response = await httpClient.post("auth/signin", body);

    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);
      UserModel userModel = UserModel.fromJson(jsonDecoded);
      return userModel;
    } else {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      throw Exception("Error");
    }
  }

  @override
  Future<UserModel?> signIn2({
    required String username,
    required String password,
  }) async {
    Response response = await httpClient.get("user/$username/$password");

    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);
      UserModel userModel = UserModel.fromJson(jsonDecoded);

      return userModel;
    } else {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      throw Exception("Error");
    }
  }

  @override
  Future<AccountModel?> signUp({
    required UserModel user,
    required AccountModel account,

  }) async {
    // String body1 = jsonEncode({
    //     "name": user.name,
    //     "gender": user.gender,
    //     "dateofBirth": user.dateofbirth.toIso8601String(),
    //     "email":user.email,
    //     "role": {
    //       "id": 1,
    //       "name": "user"
    //       }
    // });
    // String body = jsonEncode({
    //   "password": account.password,
    //   "status": account.status,
    //   "user": account.user,
    // });
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String body = jsonEncode({
      "password": account.password,
      "status": account.status,
      "user": {
        "name": user.name,
        "gender": user.gender,
        "dateOfBirth": user.dateofbirth.toIso8601String(),
        "email": user.email,

        "role": {
          "id": 1,
          "name": "user",
        }
      }
    });
    print(body);
    Response response = await httpClient.post("account", body);

    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);
      AccountModel rs = AccountModel.fromJson(jsonDecoded);
      print(rs);
      return rs;

    } else {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      throw Exception("Error");
    }
  }

  @override
  Future<AccountModel?> signUp3({
    required String password,
    required String name,
    required String gender,
    required DateTime dateofbirth,
    required String email,


  }) async {
    // String body1 = jsonEncode({
    //     "name": user.name,
    //     "gender": user.gender,
    //     "dateofBirth": user.dateofbirth.toIso8601String(),
    //     "email":user.email,
    //     "role": {
    //       "id": 1,
    //       "name": "user"
    //       }
    // });
    // String body = jsonEncode({
    //   "password": account.password,
    //   "status": account.status,
    //   "user": account.user,
    // });
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String body = jsonEncode({
      "password": password,
      "status": "1",
      "user": {
        "name": name,
        "gender": gender,
        "dateOfBirth": dateofbirth.toIso8601String(),
        "email": email,

        "role": {
          "id": 1,
          "name": "user",
        }
      }
    });
    print(body);
    Response response = await httpClient.post("account", body);

    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);
      AccountModel rs = AccountModel.fromJson(jsonDecoded);
      print(rs);
      return rs;

    } else {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      throw Exception("Error");
    }
  }

}
