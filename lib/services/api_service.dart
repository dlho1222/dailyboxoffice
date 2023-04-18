import 'dart:convert';

import 'package:dailyboxoffice/models/movie_detail_model.dart';
import 'package:dailyboxoffice/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String today = "20230409";
  static String detailUrl =
      "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888";
  static String baseUrl =
      "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888";
  static Future<MovieModel> getBoxOffice(String today) async {
    final url = Uri.parse("$baseUrl&targetDt=$today");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body);

      return MovieModel.fromJson(movies);
    }
    throw Error();
  }

  static Future<MovieDetailModel> getDetailInfo(String movieCd) async {
    final url = Uri.parse("$detailUrl&movieCd=$movieCd");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final detailInfos = jsonDecode(response.body);
      return MovieDetailModel.fromJson(detailInfos);
    }
    throw Error();
  }
}
