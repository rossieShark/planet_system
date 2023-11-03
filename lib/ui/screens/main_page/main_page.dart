import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:planet_system/ui/screens/add_new_planet_page/add_new_planet.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Color.fromARGB(255, 1, 5, 21),
              Color.fromARGB(255, 15, 2, 125),
              Color.fromARGB(255, 18, 5, 21),
            ],
            stops: [
              0.4,
              0.3,
              0.3,
            ],
          ),
        ),
      ),
      const Positioned(
        right: 21,
        top: 193,
        child: _BacgroundGreenGradient(),
      ),
      const Positioned(
        left: 0,
        top: 470,
        child: _BackgroundRedGradient(),
      ),
      const Positioned.fill(
        child: _ProgressIndicatorWidget(),
      ),
      Positioned.fill(
        child: Container(
          child: Image.asset(
            'assets/stars.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      // Adjust the blur intensity as needed
      const SumWidget(),
      SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 50,
                height: 40,
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const AddNewPlanet(),
                      ));
                    },
                    icon: Icon(Icons.add,
                        color: const Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
          ),
        ),
      )
    ]));
  }
}

class SumWidget extends StatelessWidget {
  const SumWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 100,
            width: 100,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(),
            ),
          ),
        ),
        Center(
          child: CustomPaint(
            size: const Size(100, 100),
            painter: BallPainter(),
          ),
        )
      ],
    );
  }
}

class _ProgressIndicatorWidget extends StatelessWidget {
  const _ProgressIndicatorWidget();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
        child: Container(),
      ),
    );
  }
}

class _BackgroundRedGradient extends StatelessWidget {
  const _BackgroundRedGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 191, 18, 18),
            Color.fromARGB(255, 43, 10, 81)
          ],
          center: Alignment.center,
        ),
      ),
    );
  }
}

class _BacgroundGreenGradient extends StatelessWidget {
  const _BacgroundGreenGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123.0,
      height: 123.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 125, 145, 213),
            Color.fromARGB(255, 16, 147, 222)
          ],
          center: Alignment.center,
        ),
      ),
    );
  }
}

class BallPainter extends CustomPainter {
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
