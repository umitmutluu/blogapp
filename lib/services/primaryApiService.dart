import 'dart:convert';
import 'package:http/http.dart' as http;
class PrimaryApiService {
  Future<dynamic> createAlbum(Map<String, dynamic> body) async {
    try {
      http.Response response =
      await http.post(Uri.parse("http://localhost:3000/api/users/create"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));

      var responser=jsonDecode(response.body);
      print(responser);
      return responser;

    } catch (e) {
      print('hata şu : $e');
    }
  }
}