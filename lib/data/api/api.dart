import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app_ver2/data/model/movie.dart';
import 'package:movie_app_ver2/util/constants.dart';

class Api {
  // Trending movies URL
  static const _trendingUrl =
      "${Constants.genUrl}trending/movie/day?language=en-US";

  // Top rated movies URL
  static const _topRatedUrl =
      "${Constants.genUrl}movie/top_rated?language=en-US";

  // Upcoming movies URL
  static const _upComingUrl =
      "${Constants.genUrl}movie/upcoming?language=en-US";

  // Movies genre list URL
  static const _genreListUrl =
      "https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=";

  /// - Trending Movies get method
  Future<List<Movie>> getTrendingMovies({int page = 1}) async {
    final response = await http
        .get(Uri.parse("$_trendingUrl&page=$page&api_key=${Constants.apiKey}"));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception(
          "Something went wrong with error code ${response.statusCode}");
    }
  }

  /// - Top Rated Movies get method
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response = await http
        .get(Uri.parse("$_topRatedUrl&page=$page&api_key=${Constants.apiKey}"));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception(
          "Something went wrong with error code ${response.statusCode}");
    }
  }

  /// - UpComing Movies get method
  Future<List<Movie>> getUpComingMovies({int page = 1}) async {
    final response = await http
        .get(Uri.parse("$_upComingUrl&page=$page&api_key=${Constants.apiKey}"));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromMap(movie)).toList();
    } else {
      throw Exception(
          "Something went wrong with error code ${response.statusCode}");
    }
  }

  // Genre List get method
  Future<List> getGenreList() async {
    final response =
        await http.get(Uri.parse("$_genreListUrl${Constants.apiKey}"));
    if (response.statusCode == 200) {
      return json.decode(response.body)['genres'] as List;
    } else {
      throw Exception(
          "Something went wrong with error code ${response.statusCode}");
    }
  }
}
