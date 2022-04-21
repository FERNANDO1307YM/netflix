import 'package:flutter/material.dart';

class MovieSliderWidget extends StatelessWidget {

  final String title;

  const MovieSliderWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, index) => const _MoviePoster(),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            //TODO: Cambiar por objeto
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: 'objetc'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text('Blanca nieves y los 7 enanitos, una pelicula de Disney',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
