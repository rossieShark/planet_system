// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:planet_system/providers/new_planet_provider.dart';

import 'package:planet_system/ui/screens/add_new_planet_page/text_field.dart';
import 'package:provider/provider.dart';

class AddNewPlanet extends StatefulWidget {
  const AddNewPlanet({super.key});

  @override
  State<AddNewPlanet> createState() => _AddNewPlanetState();
}

class _AddNewPlanetState extends State<AddNewPlanet> {
  Color planetColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 5, 21),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 5, 21),
        title: const Text('Add new planet'),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          PlanetBuilder(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: table
                  .map(
                    (item) => TableRow(
                      children: [
                        Container(
                          height: 50,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.title,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        item.child,
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanetBuilder extends StatelessWidget {
  const PlanetBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NewPlanetProvider>(builder: (context, newPlanet, child) {
      return Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Center(
            child: Container(
              width: newPlanet.state.raduis,
              height: newPlanet.state.raduis,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 172, 166, 166).withOpacity(0.5),
                      blurRadius: 20,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                  gradient: LinearGradient(colors: [
                    newPlanet.state.color,
                    newPlanet.state.color
                        .withBlue(100)
                        // .withGreen(50)
                        .withRed(50),
                  ])),
            ),
          ));
    });
  }
}

// class BallPainter extends CustomPainter {
//   final Color color;

//   BallPainter({
//     required this.color,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;
//     final shadowPaint = Paint()
//       ..color = color
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

//     final gradient = LinearGradient(
//       colors: [
//         color,
//         Color.fromARGB(255, 28, 26, 26).withOpacity(0.6),
//       ],
//     );
//     final ballPaint = Paint()
//           ..shader = gradient
//               .createShader(Rect.fromCircle(center: center, radius: radius))
//           ..style = PaintingStyle.fill
//         // ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
//         ;
//     // final ballPaint = Paint()
//     //   ..shader =
//     //       gradient.createShader(Rect.fromCircle(center: center, radius: radius))
//     //   ..style = PaintingStyle.fill;
//     canvas.drawCircle(center, radius, shadowPaint);
//     canvas.drawCircle(center, radius, ballPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     if (oldDelegate is BallPainter && oldDelegate.color != color) {
//       return true; // Repaint when the color changes
//     }
//     return false;
//   }
// }
