import 'package:flutter/material.dart';
import 'package:planet_system/domain/services/services_index.dart';

class PlanetBuilderWidget extends StatelessWidget {
  final double planetRadius;
  final Color planetColor;
  const PlanetBuilderWidget(
      {super.key, required this.planetRadius, required this.planetColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: planetRadius * 2,
        height: planetRadius * 2,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.5),
                blurRadius: 40,
                offset: const Offset(0, 0),
              ),
            ],
            gradient: LinearGradient(colors: [
              planetColor,
              planetColor.withBlue(100).withGreen(60).withRed(50),
            ])),
      ),
    );
  }
}
