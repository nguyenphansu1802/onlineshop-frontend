import 'package:online_shop/models/BaseObject.dart';
import 'package:online_shop/models/User.dart';

class AccountModel extends BaseObject{

  String password;
  String status;
  UserModel user;
  AccountModel({
    id,
    required this.password,
    required this.status,
    required this.user,
  }) : super(id);

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      password: json['password'],
      status: json['status'],
      user: UserModel.fromJson(json["user"]),
    );
  }
}