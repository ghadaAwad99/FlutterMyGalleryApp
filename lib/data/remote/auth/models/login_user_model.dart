import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user?.toJson(),
    "token": token == null ? null : token,
  };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt?.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };

}
