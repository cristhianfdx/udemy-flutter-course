import 'package:flutter/material.dart';
import 'package:movies/src/providers/movie_provider.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final _moviesProvider = MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in cinema'),
        backgroundColor: Colors.indigoAccent,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
        child: Column(
          children: [_getSwiperCards()],
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
          child: Center(
            child: CircularProgressIndicator()
          ),
        );
      },
    );
  }
}
