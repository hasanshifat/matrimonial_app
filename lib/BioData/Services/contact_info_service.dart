import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';

import '../../Utils/auth_class.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/snackbars.dart';

class ContactInfoService {
  late http.Response response;
  Future<http.Response> saveUpdateContactInfo(BuildContext context,
      String userId, contactPerson, relation, mobileNo, email) async {
    final url = Uri.parse("${ApiURL.baseLink}/app/insert_update_contact_info");
    var postData = jsonEncode({
      "USER_ID": userId,
      "CONTACT_PER_NAME": contactPerson,
      "RELATION": relation,
      "MOBILE_NO": mobileNo,
      "EMAIL": email,
    });

    try {
      response = await http.post(
        url,
        body: postData,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': BasicAuth().basicAuth
        },
      );
      return response;
    } catch (e) {
      CustomSnackBars().showSnackBar(
        context,
        e.toString(),
        ColorCodes.softRed,
      );
      return response;
    }
  }
}
