import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormation {
  Future<String> dateFormat(BuildContext context, String d) async {
    var inputFormat = DateTime.now();
    var outputFormat = DateFormat('yyyy-MM-dd');
    var input = DateTime.parse(d.toString());
    String date = outputFormat.format(input);
    String formatted = date;
    return formatted;
  }
}
