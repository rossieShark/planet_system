import 'dart:ui';

import 'package:flutter/material.dart';

class SunWidget extends StatelessWidget {
  const SunWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Center(
            child: CustomPaint(
              size: const Size(100, 100),
              painter: _BallPainter(),
            ),
          ))
    ]);
  }
}

class _BallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final shadowPaint = Paint()
      ..color = const Color.fromARGB(255, 238, 238, 36)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    const gradient = RadialGradient(
      colors: [
        Color.fromARGB(255, 244, 148, 4),
        Color.fromARGB(0, 230, 167, 7),
      ],
    );

    final ballPaint = Paint()
      ..shader =
          gradient.createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, shadowPaint);
    canvas.drawCircle(center, radius, ballPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
