import 'dart:convert';
import 'package:http/http.dart' as http;

class PrimaryApiService {
  Future<dynamic> sendData(
    String name,
    String username,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('https://blogapp53.herokuapp.com/api/users/create'),
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

    if ( response.statusCode==200) {
// If the server did return a 201 CREATED response,
// then parse the JSON.
    var responser =await jsonDecode(response.body);
    print(responser);
    return responser;

    } else {
// If the server did not return a 201 CREATED response,
// then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
