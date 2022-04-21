import 'package:flutter/material.dart';
import 'package:netflix/services/services.dart';
import 'package:netflix/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MovieService>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Películas'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Buscando');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiperWidget(movies: moviesProvider.onDisplayMovies),
            MovieSliderWidget(title: 'Tendencias',
              movies: moviesProvider.popularMovies,
              onNextPage: () {
                moviesProvider.getPopularMovies();
              }),
            // MovieSliderWidget(title: 'Animadas', movies: moviesProvider.popularMovies),
            // MovieSliderWidget(title: 'Aventura', movies: moviesProvider.popularMovies),
            // MovieSliderWidget(title: 'Terror', movies: moviesProvider.popularMovies)
          ],
        ),
      )
    );
  }
}
