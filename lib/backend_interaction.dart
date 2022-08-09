import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void sendCreateGameData(Map<String, dynamic> dataBox, BuildContext context) {
  Navigator.pop(context);
}

void sendGetGameByIdData(String data, BuildContext context) {
  Navigator.pop(context);
}

Future<int> registerUser(Map<String, dynamic> userData) async {
  var url = Uri.parse('http://10.0.2.2:5000/register');
  if (kDebugMode) {
    print(url);
  }
  var tmp = jsonEncode(userData);
  http.Response kek = await http.post(
    url,
    body: tmp,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );
  if (kDebugMode) {
    print(kek.body);
  }
  return kek.statusCode;
}

Future<int> loginUser(Map<String, dynamic> userData) async {
  var url = Uri.parse('http://10.0.2.2:5000/login');
  if (kDebugMode) {
    print(url);
  }
  var tmp = jsonEncode(userData);
  http.Response kek = await http.post(
    url,
    body: tmp,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );
  if (kDebugMode) {
    print(kek.body);
  }
  return kek.statusCode;
}
