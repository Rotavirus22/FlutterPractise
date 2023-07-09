import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_suggester/common/constants.dart';
import 'package:movie_suggester/models/movies_model.dart';

class HomeState extends ChangeNotifier {
  HomeState() {
    getMovies();
  }
  bool isLoading = true;
  MoviesModel? moviesModel;
  Dio dio = Dio();
  getMovies() async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await dio.get('$apiKey/movies');
      moviesModel = MoviesModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.message;
    }
    isLoading = false;
    notifyListeners();
  }
}
