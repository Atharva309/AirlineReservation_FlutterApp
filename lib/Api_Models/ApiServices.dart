import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
    "data": data == null ? null : data?.toJson(),
  };
}

class Data {
  Data({
    this.code,
  });

  String? code;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
  };
}
