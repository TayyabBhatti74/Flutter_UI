import 'dart:convert';

class LoginModel {
  String? status;
  String? message;
  Data? data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? avatar;
  int? earnings;
  String? role;
  String? status;
  String? isVerified;
  DateTime? joinedAt;
  String? ratings;
  String? bio;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.avatar,
    this.earnings,
    this.role,
    this.status,
    this.isVerified,
    this.joinedAt,
    this.ratings,
    this.bio,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    gender: json["gender"],
    phone: json["phone"],
    avatar: json["avatar"],
    earnings: json["earnings"],
    role: json["role"],
    status: json["status"],
    isVerified: json["is_verified"],
    joinedAt: json["joined_at"] == null ? null : DateTime.parse(json["joined_at"]),
    ratings: json["ratings"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "gender": gender,
    "phone": phone,
    "avatar": avatar,
    "earnings": earnings,
    "role": role,
    "status": status,
    "is_verified": isVerified,
    "joined_at": joinedAt?.toIso8601String(),
    "ratings": ratings,
    "bio": bio,
  };
}
