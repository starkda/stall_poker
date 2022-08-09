import 'dart:convert';

import 'package:http/http.dart' as http;

/// login is the same, but with URL = https://hrustim25.pythonanywhere.com/login
void register() async {
  var response = await http.post(
    Uri.parse('https://hrustim25.pythonanywhere.com/register'),
    body: jsonEncode(<String, String>{
      'login': 'testLogin',
      'password': '12345',
    }),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );

  /// code 200 - request successful, 500 - internal server error
  /// response.body - json with structure:
  /// {
  ///   'msg' : server response,
  ///   'data' :
  ///   {
  ///     'id' : id,
  ///     'coins' : coins
  ///   }
  /// }
  if (response.statusCode == 200) {
    print(response.body);
    var id = jsonDecode(response.body)['data']['id'];
    var coins = jsonDecode(response.body)['data']['coins'];
    print('id: $id, coins: $coins');
  } else {
    print('error: ${response.statusCode}, ${response.body}');
  }
}