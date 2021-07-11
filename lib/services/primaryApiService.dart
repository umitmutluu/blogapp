import 'dart:convert';
import 'package:blogapp/models/userModel.dart';
import 'package:http/http.dart' as http;

class PrimaryApiService {
  Future<User> createAlbum(
    String name,
    String username,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:3000/api/users/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
// If the server did return a 201 CREATED response,
// then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
// If the server did not return a 201 CREATED response,
// then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
