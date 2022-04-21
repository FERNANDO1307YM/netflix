import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:netflix/models/models.dart';

class CardSwiperWidget extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiperWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.6,
        itemBuilder: (_, index) {

          final movie = movies[index];

          return GestureDetector(
            //TODO: Cambiar por objeto
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: 'objetc'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
    );
  }
}
