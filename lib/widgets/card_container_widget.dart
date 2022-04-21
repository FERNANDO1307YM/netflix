import 'package:flutter/material.dart';

class CardContainerWidget extends StatelessWidget {
  final Widget child;

  const CardContainerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: child,
        decoration: _createCardShape(),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 15, offset: Offset(0, 5))
          ]);
}
