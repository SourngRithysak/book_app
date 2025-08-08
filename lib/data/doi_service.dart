import 'package:dio/dio.dart';

final dio = Dio();

class DoiService {

  Future<void> getArticle() async {
    final apiurl = "https://example.com/article";
    final header = {'Content-Type': 'application/json'};
  }

}