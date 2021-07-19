// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.picture,
    this.isAdmin,
    this.following,
    this.followers,
    this.id,
    this.name,
    this.username,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? picture;
  bool? isAdmin;
  List<dynamic>? following;
  List<dynamic>? followers;
  String? id;
  String? name;
  String?username;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    picture: json["picture"],
    isAdmin: json["isAdmin"],
    following: List<dynamic>.from(json["following"].map((x) => x)),
    followers: List<dynamic>.from(json["followers"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "picture": picture,
    "isAdmin": isAdmin,
    "following": List<dynamic>.from(following!.map((x) => x)),
    "followers": List<dynamic>.from(followers!.map((x) => x)),
    "_id": id,
    "name": name,
    "username": username,
    "email": email,
    "password": password,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}
