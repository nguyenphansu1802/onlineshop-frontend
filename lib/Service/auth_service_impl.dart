
import 'dart:convert';

import 'package:online_shop/api/http_client.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
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
      // sharedPreferences.setString("token", userModel.accessToken);
      return userModel;
    } else {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      throw Exception("Error");
    }
  }

  @override
  Future<String> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    String body = jsonEncode({
      "userName": username,
      "email": email,
      "password": password,
    });

    Response response = await httpClient.post("auth/signup", body);

    if (response.statusCode == 200) {
      dynamic jsonDecoded = jsonDecode(response.body);
      return response.body;
    } else {
      print(response.body);
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
      // sharedPreferences.setString("token", userModel.accessToken);

      return userModel;
    } else {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      throw Exception("Error");
    }
  }
}
