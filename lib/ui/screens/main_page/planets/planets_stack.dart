import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planet_system/bloc/index.dart';
import 'package:planet_system/domain/models/models_index.dart';
import 'package:planet_system/domain/services/services_index.dart';
import 'package:planet_system/ui/widgets/widgets_index.dart';

class PlanetsStack extends StatelessWidget {
  const PlanetsStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<PlanetsBloc>().add(const LoadPlanetsBlocEvent());
    return Center(
      child: BlocBuilder<PlanetsBloc, PlanetsState>(builder: (context, state) {
        return state.map(
            empty: (_) => Container(),
            error: (_) => Container(),
            loaded: (data) => Stack(
                  children: data.planets.map((planet) {
                    return _PlanetStack(
                      planet: planet,
                    );
                  }).toList(),
                ));
      }),
    );
  }
}

class _TrajectoryPainter extends CustomPainter {
  final double radius;
  _TrajectoryPainter({
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.3;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _PlanetStack extends StatefulWidget {
  const _PlanetStack({
    required this.planet,
  });
  final NewPlanetModel planet;

  @override
  State<_PlanetStack> createState() => __PlanetStackState();
}

class __PlanetStackState extends State<_PlanetStack>
    with TickerProviderStateMixin {
  late AnimationController rotationController;
  late Animation<double> rotationAnimation;
  bool isRotating = false;

  @override
  void initState() {
    super.initState();

    double duration =
        (2 * pi * widget.planet.distance!) / widget.planet.velocity!;

    rotationController = AnimationController(
      duration: Duration(seconds: duration.toInt()),
      vsync: this,
    );

    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(rotationController);
    rotationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
        iOS: GestureDetector(
          onLongPress: onLongPressIos,
          onTap: toggleRotation,
          child: _PlanetsDrawer(
              widget: widget, rotationAnimation: rotationAnimation),
        ),
        other: GestureDetector(
          onLongPress: onLongPressMaterial,
          onTap: toggleRotation,
          child: _PlanetsDrawer(
              widget: widget, rotationAnimation: rotationAnimation),
        ),
        builder: (context, child, widget) {
          return widget;
        });
  }

  void toggleRotation() {
    isRotating ? rotationController.stop() : rotationController.repeat();

    setState(() {
      isRotating = !isRotating;
    });
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  void onLongPressIos() {
    AlertDialogWidget().showAlertDialogIos(
        context: context,
        title: "Do you really want to delete planet ${widget.planet.name}?",
        onPressed: () {
          context
              .read<PlanetsBloc>()
              .add(RemovePlanetsBlocEvent(widget.planet.name!));
        });
  }

  void onLongPressMaterial() {
    AlertDialogWidget().showAlertDialogMaterial(
        context: context,
        title: "Do you really want to delete planet ${widget.planet.name}?",
        onPressed: () {
          context
              .read<PlanetsBloc>()
              .add(RemovePlanetsBlocEvent(widget.planet.name!));
        });
  }
}

class _PlanetsDrawer extends StatelessWidget {
  const _PlanetsDrawer({
    required this.widget,
    required this.rotationAnimation,
  });

  final _PlanetStack widget;

  final Animation<double> rotationAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CustomPaint(
            size: Size(widget.planet.distance!, widget.planet.distance!),
            painter: _TrajectoryPainter(radius: widget.planet.distance!),
          ),
        ),
        RotationTransition(
          turns: rotationAnimation,
          child: Transform.translate(
              offset: Offset(widget.planet.distance! * cos(0),
                  widget.planet.distance! * sin(0)),
              child: PlanetBuilderWidget(
                planetRadius: widget.planet.raduis!,
                planetColor: widget.planet.color!,
              )),
        ),
      ],
    );
  }
}
