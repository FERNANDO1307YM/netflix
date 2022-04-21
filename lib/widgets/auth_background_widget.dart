import 'package:flutter/material.dart';

class AuthBackgroundWidget extends StatelessWidget {

  final Widget child;

  const AuthBackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.grey[300],
      width: double.infinity,
      child: Stack(
        children: [
          const _Box(),
          SafeArea(
            child: Container(
              width: double.infinity,
              child: const Icon(Icons.person, color: Colors.white, size: 100,),
              margin: const EdgeInsets.only(top:30),
            ),
          ),
          child
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      decoration: _background(),
      child: Stack(
        children: const [
          Positioned(child: _Circle(), top: 90, left: 30,),
          Positioned(child: _Circle(), top: -40, left: -30,),
          Positioned(child: _Circle(), top: -50, right: -20,),
          Positioned(child: _Circle(), bottom: -50, left: 10,),
          Positioned(child: _Circle(), bottom: 120, right: 20,),
        ],
      ),
    );
  }

  BoxDecoration _background() => const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1)
          ]
      )
  );
}

class _Circle extends StatelessWidget {
  const _Circle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}
