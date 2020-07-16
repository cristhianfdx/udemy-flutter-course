import 'package:flutter/material.dart';

import 'package:movies/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);
  final Function nextPage;

  MovieHorizontal({@required this.movies, @required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      final position = _pageController.position;
      if (position.pixels >= position.maxScrollExtent - 200) nextPage();
    });

    return Container(
      height: _screenSize.height * 0.20,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, index) =>
            _getCard(context, movies[index], _screenSize),
      ),
    );
  }

  Widget _getCard(BuildContext context, Movie movie, Size size) {
    movie.uuid = '${movie.id}-poster';

    final card = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Hero(
            tag: movie.uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                image: NetworkImage(movie.getPosterImage()),
                height: size.height * 0.1678,
                width: size.width * 0.223,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );

    return GestureDetector(
      child: card,
      onTap: () => Navigator.pushNamed(context, '/detail', arguments: movie),
    );
  }
}
