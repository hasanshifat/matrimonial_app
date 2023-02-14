import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';
import 'package:matrimonial_app/Utils/auth_class.dart';
import 'package:matrimonial_app/Utils/snackbars.dart';
import '../../Utils/color_codes.dart';
import '../Pages/registration_page.dart';

class RegistrationService {
  Future regService(BuildContext context, Map<String, String> regData,
      Map<String, String> logData) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${ApiURL.baseLink}/user_master/'),
        body: json.encode(regData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': BasicAuth().basicAuth
        },
      );
      http.Response resLogin = await http.post(
        Uri.parse('${ApiURL.baseLink}/user_login/'),
        body: json.encode(logData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': BasicAuth().basicAuth
        },
      );
      print("Body Master: ${jsonDecode(res.body)}");
      print("Body Login: ${jsonDecode(resLogin.body)}");
      //print(res.statusCode);
      if (res.statusCode == 200 && resLogin.statusCode == 200) {
        // ignore: use_build_context_synchronously
        CustomSnackBars().showSnackBar(
          context,
          'রেজিস্ট্রেশন সফলভাবে সম্পন্ন হয়েছে',
          ColorCodes.softGreen,
        );
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          context,
          RegistrationPage.routeName,
          (route) => true,
        );
      } else {
        // ignore: use_build_context_synchronously
        CustomSnackBars().showSnackBar(
          context,
          jsonDecode(res.body)['message'],
          ColorCodes.softRed,
        );
      }
      // httpErrorHandle(
      //   response: res,
      //   context: context,
      //   onSuccess: () async {
      //     if (jsonDecode(res.body)['message'] == 'Success') {
      //       SharedPreferences prefs = await SharedPreferences.getInstance();
      //       // ignore: use_build_context_synchronously
      //       Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      //       await prefs.setString('token', jsonDecode(res.body)['token']);
      //       // ignore: use_build_context_synchronously
      //       Navigator.pushNamedAndRemoveUntil(
      //         context,
      //         RegistrationPage.routeName,
      //         (route) => false,
      //       );
      //     }
      //   },
      // );
    } catch (e) {
      CustomSnackBars().showSnackBar(
        context,
        e.toString(),
        ColorCodes.softRed,
      );
    }
  }
}
