import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:matrimonial_app/Homepage/model/district_model.dart';

class DistricService {
  static Future<List<DistrictModel>> getDistricts() async {
    try {
      final bookJson = await rootBundle.rootBundle
          .loadString('assets/district json/division_district_thana_list.json');
      final list = json.decode(bookJson) as List<dynamic>;

      return list.map((e) => DistrictModel.fromJson(e)).toList();
    } catch (e) {
      print('error: $e');
      return List.empty();
    }
  }
}
