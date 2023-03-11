import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BasicAuth {
  String foo2 = dotenv.get('FOO2');
  String foo = dotenv.get('FOO');
  String get newMethod => '$foo:$foo2';

  String basicAuth = 'Basic ${base64.encode(utf8.encode(''))}';
}
