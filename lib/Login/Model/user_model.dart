import 'dart:convert';

class User {
  final String token;
  final List<Data> data;

  User({
    required this.token,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'cart': data,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      token: map['token'] ?? '',
      data: List<Data>.from(map["data"]!.map((x) => Data.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? token,
    List<Data>? data,
  }) {
    return User(
      token: token ?? this.token,
      data: data ?? this.data,
    );
  }
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
