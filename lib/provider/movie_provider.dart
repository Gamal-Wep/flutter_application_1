import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/services/movie_services.dart';

class MovieProvider extends ChangeNotifier {
  MovieModel? model;
  Future<void> getData() async {
    model = await MovieServices.fetchData();
    notifyListeners();
  }
}
