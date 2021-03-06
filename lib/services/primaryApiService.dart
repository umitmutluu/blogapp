import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class PrimaryApiService {
  Dio dio =Dio();

  //post methods here!
  Future<dynamic> postMethods(String endPoints,
      Map<String, dynamic> requirements,) async {
    final response = await dio.post(
        'https://blogapp53.herokuapp.com'+endPoints,data: requirements,
//todo opstions sekmesinde header seçeneği eklenecek ve dönen header da tokenvar
    );

    if (response.statusCode == 200||response.statusCode==201) {
// If the server did return a 201 CREATED response,
// then parse the JSON.
      print(response.data.toString());
      var responser= jsonEncode(response.data);
      print(responser);
      return jsonDecode(responser);
    } else {
// If the server did not return a 201 CREATED response,
// then throw an exception.
      throw Exception('Failed to create album.');
    }
  }




}
