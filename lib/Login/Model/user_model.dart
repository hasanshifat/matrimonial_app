// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.token,
        this.data,
    });

    String? token;
    List<Data>? data;

    factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Data {
    Data({
        this.ulId,
        this.userId,
        this.userName,
    });

    int? ulId;
    int? userId;
    String? userName;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ulId: json["UL_ID"],
        userId: json["USER_ID"],
        userName: json["USER_NAME"],
    );

    Map<String, dynamic> toJson() => {
        "UL_ID": ulId,
        "USER_ID": userId,
        "USER_NAME": userName,
    };
}
