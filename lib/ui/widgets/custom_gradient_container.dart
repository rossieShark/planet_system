import 'package:flutter/material.dart';

class CustomRadialGradient extends StatelessWidget {
  final double diameter;
  final List<Color> colors;
  const CustomRadialGradient(
      {super.key, required this.diameter, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: colors,
          center: Alignment.center,
        ),
      ),
    );
  }
}
