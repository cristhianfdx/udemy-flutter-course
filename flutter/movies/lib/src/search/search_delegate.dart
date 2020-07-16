import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/providers/movie_provider.dart';

class DataSearch extends SearchDelegate {
  final _movieProvider = MovieProvider();
  String selection = '';

  final movies = [
    'Spiderman',
    'Batman',
    'Superman',
    'Iron Man',
    'Capitan America',
  ];

  final newMovies = [
    'Capitan America',
    'Batman',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();

    return FutureBuilder(
      future: _movieProvider.getMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView(
            children: movies.map((movie) {
              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(movie.getPosterImage()),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: () {
                  close(context, null);
                  movie.uuid = '';
                  Navigator.pushNamed(context, '/detail', arguments: movie);
                },
              );
            }).toList(),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   final suggestionlist = (query.isEmpty)
  //       ? newMovies
  //       : movies
  //           .where((m) => m.toLowerCase().startsWith(query.toLowerCase()))
  //           .toList();

  //   return ListView.builder(
  //       itemCount: suggestionlist.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           leading: Icon(Icons.movie),
  //           title: Text(suggestionlist[index]),
  //           onTap: () {
  //             selection = suggestionlist[index];
  //             showResults(context);
  //           },
  //         );
  //       });
  // }
}
