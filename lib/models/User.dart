import 'package:online_shop/models/BaseObject.dart';
import 'package:online_shop/models/Role.dart';

class UserModel extends BaseObject{

  final String name;
  final String email;
  final String gender;
  final DateTime dateofbirth;
  final RoleModel role;
  final String image;

  UserModel({
    id,
    required this.name,
    required this.gender,
    required this.dateofbirth,
    required this.email,
    required this.role,
    required this.image,
  }) : super(id);


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      gender: json['gender'] ?? "",
      dateofbirth: DateTime.parse(json["dateOfBirth".toString()]),
      email: json['email'] ?? "",
      image: json['image'] ?? "",
      role: RoleModel.fromJson(json['role']),

    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "gender": this.gender,
      "dateOfBirth": this.dateofbirth,
      "email": this.email,
      "image": this.image,
    };
  }

  UserModel cloneWith({
    id,
    name,
    gender,
    dateofbirth,
    email,
    image,
    role,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dateofbirth: dateofbirth ?? this.dateofbirth,
      email: email ?? this.email,
      image: image ?? this.image,
      role: role ?? this.role
    );
  }

  @override
  String toString() {
    return "UserModel:{name:${this.name},gander:${this.gender},dateOfBirth:${this.dateofbirth},email:${this.email},image:${this.image}}";
  }


  @override
  List<Object?> get props => [email, id, name, gender, dateofbirth, email, image];
}


