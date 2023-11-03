import 'package:flutter/material.dart';
import 'package:planet_system/ui/screens/add_new_planet_page/color_picker.dart';
import 'package:planet_system/providers/new_planet_provider.dart';
import 'package:planet_system/models/table_model.dart';
import 'package:planet_system/ui/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class RadiusTextField extends StatelessWidget {
  RadiusTextField({super.key});

  final TextEditingController _radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPlanetProvider = context.read<NewPlanetProvider>();
    return CustomTextField(
      controller: _radiusController,
      onSubmitted: (value) {
        newPlanetProvider.changeRadius(double.parse(value));
      },
    );
  }
}

class DistanceTextField extends StatelessWidget {
  DistanceTextField({super.key});

  final TextEditingController _distanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final newPlanetProvider = context.read<NewPlanetProvider>();
    return CustomTextField(
      controller: _distanceController,
      onSubmitted: (value) {
        newPlanetProvider.changeDistance(int.parse(value));
      },
    );
  }
}

class VelocityTextField extends StatelessWidget {
  VelocityTextField({super.key});

  final TextEditingController _velocityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPlanetProvider = context.read<NewPlanetProvider>();
    return CustomTextField(
      controller: _velocityController,
      onSubmitted: (value) {
        newPlanetProvider.changeVelocity(double.parse(value));
      },
    );
  }
}

List<TableModel> table = [
  TableModel(
    title: 'Color',
    child: ColorPickerButton(),
  ),
  TableModel(
    title: 'Radius',
    child: RadiusTextField(),
  ),
  TableModel(
    title: 'Distance from sun',
    child: DistanceTextField(),
  ),
  TableModel(
    title: 'Velocity',
    child: VelocityTextField(),
  ),
];
