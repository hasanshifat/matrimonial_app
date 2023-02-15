import 'package:flutter/material.dart';

class NavigatorPgaeUtils {
  final BuildContext context;
  NavigatorPgaeUtils({required this.context});
  void pop() {
    Navigator.of(context).pop();
  }
}
