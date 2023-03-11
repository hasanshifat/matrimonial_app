import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';
import 'package:matrimonial_app/Homepage/pages/navigation_bar_page.dart';
import 'package:matrimonial_app/Utils/snackbars.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/auth_class.dart';
import '../../Utils/color_codes.dart';
import '../Model/user_model.dart';
import '../Provider/user.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginService {
  Future<List<UserListData>> loginService(
      BuildContext context, String? username, String? password) async {
    String foo2 = dotenv.get('FOO2');
    String foo = dotenv.get('FOO');
    String newMethod = '$foo:$foo2';
    String basicAuth = 'Basic ${base64.encode(utf8.encode(newMethod))}';
    List<UserListData> l = [];
    Map<String, dynamic> data = {
      'USER_NAME': username,
      'USER_PASS': password,
    };
    try {
      http.Response res = await http.post(
        Uri.parse('${ApiURL.baseLink}/app/login'),
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': basicAuth
        },
      );
      var v = jsonDecode(res.body)['message'];

      //print(res.statusCode);
      if (v == 'Success') {
        Map<String, dynamic> map = json.decode(res.body);
        List<dynamic> data = map['data'];

        l = userListDataFromJson(jsonEncode(data));
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
        // ignore: use_build_context_synchronously

        //ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          context,
          NavBarPage.routeName,
          (route) => false,
        );

        return l;
      } else {
        // ignore: use_build_context_synchronously
        CustomSnackBars().showSnackBar(
          context,
          jsonDecode(res.body)['message'],
          ColorCodes.softRed,
        );
      }
    } catch (e) {
      print(e.toString());
      CustomSnackBars().showSnackBar(
        context,
        e.toString(),
        ColorCodes.softRed,
      );
    }
    return List.empty();
  }

  void pushToPage(context) {}
}
