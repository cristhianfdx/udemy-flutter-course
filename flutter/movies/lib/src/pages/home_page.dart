import 'package:flutter/material.dart';

import 'package:movies/src/providers/movie_provider.dart';
import 'package:movies/src/search/search_delegate.dart';

import 'package:movies/src/widgets/card_swiper_widget.dart';
import 'package:movies/src/widgets/movie_horizontal_widget.dart';

class HomePage extends StatelessWidget {
  final _moviesProvider = MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in cinema'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_getSwiperCards(), _getFooter(context)],
        ),
      ),
    );
  }

  Widget _getSwiperCards() {
    return FutureBuilder(
      future: _moviesProvider.getMoviesInCinnema(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(movies: snapshot.data);
        }
        return Container(
          height: 400.0,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _getFooter(BuildContext context) {
    _moviesProvider.getPopularMovies();

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Populars",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          StreamBuilder(
            stream: _moviesProvider.popularsStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  movies: snapshot.data,
                  nextPage: _moviesProvider.getPopularMovies,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
