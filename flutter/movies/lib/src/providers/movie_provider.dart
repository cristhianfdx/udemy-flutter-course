import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:movies/src/models/movie_model.dart';

class MovieProvider {
  String _apiKey = '90818b62a2eba6661a5134d40c8a289f';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';

  Future<List<Movie>> getMoviesInCinnema() async {
    final uri = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    final response = await http.get(uri);
    final data = json.decode(response.body);
    final m = Movies.fromJsonList(data['results']);
    return m.movies;
  }
}
