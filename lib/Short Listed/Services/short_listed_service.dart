// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';
import 'package:matrimonial_app/Utils/auth_class.dart';
import '../../Common UI/loading_diaalogs.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/error_handles.dart';
import '../../Utils/snackbars.dart';

class ShortlistService {
  Future sendRequestService(
      BuildContext context, Map<String, String> sendData) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${ApiURL.baseLink}/request_biodata/'),
        body: json.encode(sendData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': BasicAuth().basicAuth
        },
      );
      print(res.statusCode);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          CustomSnackBars.snackBarDone(
            context,
            'অনুরোধ সম্পন্ন হয়েছে',
            ColorCodes.deepGrey,
          );
          //     if (jsonDecode(res.body)['message'] == 'Success') {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          // Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          // await prefs.setString('token', jsonDecode(res.body)['token']);
          // ignore: use_build_context_synchronously
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   RegistrationPage.routeName,
          //   (route) => false,
          // );
          //     }
        },
      );
    } catch (e) {
      print(e);
      // CustomSnackBars().showSnackBar(
      //   context,
      //   e.toString(),
      //   ColorCodes.softRed,
      // );
    }
  }
}
