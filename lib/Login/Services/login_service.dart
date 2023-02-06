import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';
import 'package:matrimonial_app/SignUp/Pages/registration_page.dart';
import 'package:matrimonial_app/Utils/snackbars.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/error_handles.dart';
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
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
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
        },
      );
    } catch (e) {
      CustomSnackBars().showSnackBar(context, e.toString());
    }
  }
}
