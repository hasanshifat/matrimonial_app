// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';
import 'package:matrimonial_app/Utils/auth_class.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/snackbars.dart';

class HomePageService {
  late BuildContext context;
  bioataViewService(Map<String, dynamic> data) async {
    print(data);
    
    try {
      http.Response res = await http.post(
        Uri.parse('${ApiURL.baseLink}/app/biodata_view_insertion'),
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': BasicAuth().basicAuth
        },
      );
      print('Body: ${res.body}');
    } catch (e) {
      print(e);
      CustomSnackBars().showSnackBar(
        context,
        e.toString(),
        ColorCodes.softRed,
      );
    }
  }
}
//https://g76f0005d9121d8-dbq63zy.adb.ap-singapore-1.oraclecloudapps.com/ords/shifat_workspace/app/biodata_view_insertion