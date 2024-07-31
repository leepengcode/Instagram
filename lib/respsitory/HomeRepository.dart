import 'package:demo_app_provider/data/network/BaseApiServices.dart';
import 'package:demo_app_provider/data/network/NetworkApiServices.dart';
import 'package:demo_app_provider/model/movie_model.dart';
import 'package:demo_app_provider/res/component/auth_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServicse();

  Future<List<MovieListModel>> fetchMovieList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.topMoviesEndPoint);

      return response = MovieListModel.fromJsonList(response);
    } catch (e) {
      throw e;
    }
  }
}
