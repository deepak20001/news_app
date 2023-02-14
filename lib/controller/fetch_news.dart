import 'dart:convert';
import 'package:http/http.dart';

class FetchNews {
  static fetchNews() async {
    Response response = await get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=in&apiKey=a8665116b78c471e9a779187467735a0"),
    );
    Map body_data = jsonDecode(response.body);
    print(body_data);
  }
}
