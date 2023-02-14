import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    token: '',
    data: [],
  );

  User get user => _user;

  void setUser(String user) {
    Map<String, dynamic> valueMap = json.decode(user);
    _user = User.fromJson(valueMap);
    for (var element in _user.data!) {
      // ignore: avoid_print
      print(element.userName);
    }
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
