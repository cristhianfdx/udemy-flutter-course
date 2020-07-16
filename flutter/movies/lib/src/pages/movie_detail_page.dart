import 'package:flutter/material.dart';
import 'package:movies/src/models/actor_model.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/providers/movie_provider.dart';

class MovieDetail extends StatefulWidget {
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _getAppBar(movie),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 10.0),
            _getPoster(context, movie),
            _getDescription(movie),
            _getDescription(movie),
            _getDescription(movie),
            _getDescription(movie),
            _getCast(movie),
          ]))
        ],
      ),
    );
  }

  Widget _getAppBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(movie.getBackgroundImage()),
          fadeInDuration: Duration(milliseconds: 10),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getPoster(BuildContext context, Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: movie.uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(movie.getPosterImage()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                movie.originalTitle,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: Colors.amber,
                  ),
                  Text(movie.voteAverage.toString())
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _getDescription(Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _getCast(Movie movie) {
    final movieProvider = MovieProvider();

    return FutureBuilder(
      future: movieProvider.getCast(movie.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _getActorsPageView(snapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _getActorsPageView(List<Actor> actors) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: actors.length,
        itemBuilder: (context, index) => _getCardActor(actors[index]),
      ),
    );
  }

  Widget _getCardActor(Actor actor) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
                height: 150.0,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(actor.getPhoto())),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
