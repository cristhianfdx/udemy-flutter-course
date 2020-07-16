import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:movies/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          movies[index].uuid = '${movies[index].id}-card';

          return Hero(
            tag: movies[index].uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                child: FadeInImage(
                  image: NetworkImage(movies[index].getPosterImage()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
                onTap: () => Navigator.pushNamed(context, '/detail',
                    arguments: movies[index]),
              ),
            ),
          );
        },
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.70,
        itemHeight: _screenSize.height * 0.50,
      ),
    );
  }
}
