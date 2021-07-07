import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:http/http.dart' as http;

Future<dynamic> createUser(
  String name,
  String username,
  String email,
  String password,
  //Map<String, dynamic> body, todo burayı devreye sokacağım
) async {
  try {
    final http.Response response =
        await http.post(Uri.parse('http://localhost:3000/api/users/create'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'name': name,
              'username': username,
              'email': email,
              'password': password,
            }));


    var _resBody =jsonDecode(response.body);
    return _resBody;
  } catch (e) {print('hata $e');}


}
