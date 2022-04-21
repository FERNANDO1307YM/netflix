import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/models/models.dart';
import 'package:netflix/services/services.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    print(movie.title);

    return Scaffold(
        body: CustomScrollView(
        slivers: [
          _CustomAppBar(title: movie.title, urlImage: movie.fullPosterImg),
          SliverList(delegate: SliverChildListDelegate([
            _PosterAndTitle(
            title: movie.title,
            subtitle: movie.originalTitle,
            urlImage: movie.fullPosterImg,
            stars: movie.voteAverage.toString(),
          ),
          _DescriptionMovie(description: movie.overview),
            _CastingCard(movieId: movie.id,)
          ]))
        ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {

  final String title;
  final String urlImage;

  const _CustomAppBar({Key? key, required this.title, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(title, style: const TextStyle(fontSize: 16)),
          ),
        ),
        background: FadeInImage(
          placeholder: NetworkImage('https://via.placeholder.com/500x200'),
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final String? urlImage;
  final String title;
  final String subtitle;
  final String? stars;

  const _PosterAndTitle(
      {Key? key,
      this.urlImage,
      required this.title,
      required this.subtitle,
      this.stars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const NetworkImage('https://via.placeholder.com/200x300'),
              image: NetworkImage(urlImage ?? 'https://via.placeholder.com/200x300'),
              height: 180,
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 5,),
                Text(subtitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Icon(Icons.star, size: 20, color: Colors.blue,),
                    const SizedBox(width: 5,),
                    Text('$stars', style: Theme.of(context).textTheme.caption,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DescriptionMovie extends StatelessWidget {

  final String description;

  const _DescriptionMovie({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class _CastingCard extends StatelessWidget {

  final int movieId;

  const _CastingCard({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MovieService>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: ( _ , AsyncSnapshot<List<Cast>> snapshot) {
        if( !snapshot.hasData ) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator()
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: EdgeInsets.only( bottom: 30 ),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ( _, int index) => _CastCard(cast: cast[index]),
          ),
        );

      },
    );

  }
}

class _CastCard extends StatelessWidget {

  final Cast cast;

  const _CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/200x300'),
              image: NetworkImage(cast.fullProfileImg),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            'actor.name',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}