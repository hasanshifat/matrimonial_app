import 'dart:convert';

class BasicAuth {
  String basicAuth =
      'Basic ${base64.encode(utf8.encode('shifat:@#Fusion1234#@'))}';
}
