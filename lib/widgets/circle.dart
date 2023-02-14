import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double size;
  const Circle({Key? key, required this.size, required List<Color> colors})
      : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 222, 176, 108),
      ),
    );
  }
}
