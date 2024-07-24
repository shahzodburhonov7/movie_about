import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/movie.dart';

const apiKey = "f8747d541b2902c8db4e7b5c17999a54";

class APIServices {
  final nowShowingApi =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";
  final upComingApp =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularApi =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

  Future<List<Movie>> getNowShowing() async {
    Uri url = Uri.parse(nowShowingApi);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Movie>> getUpComing() async {
    Uri url = Uri.parse(upComingApp);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Movie>> getPopular() async {
    Uri url = Uri.parse(popularApi);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
