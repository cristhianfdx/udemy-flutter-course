import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/actor_model.dart';
import 'package:movies/src/models/movie_model.dart';

class MovieProvider {
  String _apiKey = '90818b62a2eba6661a5134d40c8a289f';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';

  int _popularPage = 0;
  bool _isCharging = false;
  List<Movie> _populars = new List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;

  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  void dispose() {
    _popularsStreamController?.close();
  }

  Future<List<Movie>> _getMovies(Uri uri) async {
    final response = await http.get(uri);
    final data = json.decode(response.body);
    final m = Movies.fromJsonList(data['results']);
    return m.movies;
  }

  Future<List<Movie>> getMoviesInCinnema() async {
    final uri = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });
    return await _getMovies(uri);
  }

  Future<List<Movie>> getPopularMovies() async {
    if (_isCharging) return [];

    _isCharging = true;
    _popularPage++;

    final uri = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularPage.toString(),
    });

    final response = await _getMovies(uri);
    _populars.addAll(response);
    popularsSink(_populars);
    _isCharging = false;
    return response;
  }

  Future<List<Actor>> getCast(String movieId) async {
    final uri = Uri.https(_url, '3/movie/$movieId /credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final response = await http.get(uri);
    final decodedData = json.decode(response.body);
    final cast = Cast.fromJsonList(decodedData['cast']);
    return cast.actors;
  }

  Future<List<Movie>> getMovie(String query) async {
    final uri = Uri.https(_url, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
    });
    return await _getMovies(uri);
  }
}
