import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/movie_model.dart';

class MovieServices {
  static Dio dio = Dio();

  static Future<MovieModel> fetchData() async {
    try {
      final response = await dio.get("https://apimovie.runasp.net/api/Movies");

      return MovieModel.fromjson(response.data);
    } on DioException catch (dioErorr) {
      throw Exception("dioError is :  $dioErorr");
    } catch (error) {
      throw Exception("the error is : $error");
    }
  }
}
