// To parse this JSON data, do
//
//     final hobbiesTypeModel = hobbiesTypeModelFromJson(jsonString);

import 'dart:convert';

List<HobbiesTypeModel> hobbiesTypeModelFromJson(String str) => List<HobbiesTypeModel>.from(json.decode(str).map((x) => HobbiesTypeModel.fromJson(x)));

String hobbiesTypeModelToJson(List<HobbiesTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HobbiesTypeModel {
    HobbiesTypeModel({
        this.hobbyId,
        this.hobbyName,
    });

    int? hobbyId;
    String? hobbyName;

    factory HobbiesTypeModel.fromJson(Map<String, dynamic> json) => HobbiesTypeModel(
        hobbyId: json["hobby_id"],
        hobbyName: json["hobby_name"],
    );

    Map<String, dynamic> toJson() => {
        "hobby_id": hobbyId,
        "hobby_name": hobbyName,
    };
}
