
import 'dart:_http';

import 'package:online_shop/Service/user_service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IUserServiceImpl implements IUserService {
  final SharedPreferences sharedPreferences;
  final HttpClient httpClient;

  IUserServiceImpl({
    required this.httpClient,
    required this.sharedPreferences,
  });
}