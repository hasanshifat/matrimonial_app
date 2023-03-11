import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matrimonial_app/Login/Services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user_model.dart';

class UserProvider extends ChangeNotifier {
  late List<UserListData> _uList = [];
  List<UserListData> get uList => _uList;
  bool isLoading = false;

  void setUser(List<UserListData> list) async {
    _uList = list;
    isLoading = false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('userList', jsonEncode(_uList));
    notifyListeners();
  }

  void setUserFromModel(context, username, password) async {
    isLoading = true;
    var data = await LoginService().loginService(context, username, password);
    setUser(data);
  }

  void setUserData(List<UserListData> list) async {
    _uList = list;
    isLoading = false;
    print('List:${_uList.length}');
    _uList.forEach(
      (element) => print(element.userName),
    );
    notifyListeners();
  }
}
