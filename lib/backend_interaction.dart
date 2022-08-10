import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

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
  http.Response kek = await http.post(url, body: tmp, headers: <String, String>{
    'Content-Type': 'application/json',
  });
  if (kDebugMode) {}
  if (kek.statusCode == 200) {
    print(jsonDecode(kek.body)['data']['id']);
    int id = jsonDecode(kek.body)['data']['id'];
    Map<String, dynamic> data = await getUserDataById(id);
    User(data['coins'], data['id'], data['login']);
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
  // if (kek.statusCode == 200) {
  //   int id = jsonDecode(kek.body)['data']['id'];
  //   Map<String, dynamic> data = await getUserDataById(id);
  //   User(data['coins'], data['id'], data['login']);
  // }
  print(userData);

  return kek.statusCode;
}

Future<Map<String, dynamic>> getUserDataById(int id) async {
  var url = Uri.parse('http://10.0.2.2:5000/users?id=$id');
  http.Response data = await http.get(url);

  if (kDebugMode) {
    print(data.body);
  }
  return jsonDecode(data.body)['data'];
}
