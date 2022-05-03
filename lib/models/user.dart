class UserModel {
  int id;
  String name;
  String email;
  String gender;
  DateTime dateofbirth;
  // int roleid;

  UserModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.dateofbirth,
    required this.email,
    // required this.gender,
    // required this.roleid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      dateofbirth: json["dateofbirth"],
      email: json['email'],
      // gender:  json['gender'],
      // roleid: json['roleid'],
    );
  }
}
