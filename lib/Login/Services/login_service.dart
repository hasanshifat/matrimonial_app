import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';
import 'package:matrimonial_app/SignUp/Pages/registration_page.dart';
import 'package:matrimonial_app/Utils/snackbars.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/color_codes.dart';
import '../Provider/user.dart';

class LoginService {
  Future loginService(
      BuildContext context, String? username, String? password) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${ApiURL.baseLink}/app/login'),
        body: jsonEncode({
          'USER_NAME': username,
          'USER_PASS': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      //print("error: ${jsonDecode(res.body)['message']}");
      //print(res.statusCode);
      if (jsonDecode(res.body)['message'] == 'Success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // ignore: use_build_context_synchronously
        Provider.of<UserProvider>(context, listen: false).setUser(res.body);
        await prefs.setString('token', jsonDecode(res.body)['token']);
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          context,
          RegistrationPage.routeName,
          (route) => false,
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