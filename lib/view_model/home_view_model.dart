import 'package:demo_app_provider/data/respnse/api_responese.dart';
import 'package:demo_app_provider/model/movie_model.dart';
import 'package:demo_app_provider/respsitory/HomeRepository.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<List<MovieListModel>> movieList = ApiResponse.loading();

  void setMovieList(ApiResponse<List<MovieListModel>> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    setMovieList(ApiResponse.loading());

    _myRepo.fetchMovieList().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
