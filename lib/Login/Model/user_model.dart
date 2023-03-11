// To parse this JSON data, do
//
//     final userListData = userListDataFromJson(jsonString);

import 'dart:convert';

List<UserListData> userListDataFromJson(String str) => List<UserListData>.from(json.decode(str).map((x) => UserListData.fromJson(x)));

String userListDataToJson(List<UserListData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListData {
    UserListData({
       required this.ulId,
       required this.userId,
       required this.userName,
    });

    int ulId;
    String userId;
    String userName;

    factory UserListData.fromJson(Map<String, dynamic> json) => UserListData(
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
