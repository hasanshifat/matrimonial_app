import 'package:flutter/material.dart';

import '../Model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    token: '',
    data: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    print(_user.data);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
