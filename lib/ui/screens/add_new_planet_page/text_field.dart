import 'package:flutter/material.dart';
import 'package:planet_system/models/models_index.dart';
import 'package:planet_system/providers/provider_index.dart';
import 'package:planet_system/ui/screens/add_new_planet_page/color_picker.dart';
import 'package:planet_system/ui/widgets/widgets_index.dart';

class RadiusTextField extends StatefulWidget {
  const RadiusTextField({super.key});

  @override
  State<RadiusTextField> createState() => _RadiusTextFieldState();
}

class _RadiusTextFieldState extends State<RadiusTextField> {
  final TextEditingController _radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPlanetProvider = context.read<NewPlanetProvider>();
    return CustomTextField(
      controller: _radiusController,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          newPlanetProvider.changeRadius(double.parse(value));
        }
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
        if (value.isNotEmpty) {
          newPlanetProvider.changeDistance(double.parse(value));
        }
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
        if (value.isNotEmpty) {
          newPlanetProvider.changeVelocity(double.parse(value));
        }
      },
    );
  }
}

class NameTextField extends StatelessWidget {
  NameTextField({super.key});

  final TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPlanetProvider = context.read<NewPlanetProvider>();
    return CustomTextField(
      textInputType: TextInputType.name,
      controller: _nameTextController,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          newPlanetProvider.changeName(value);
        }
      },
    );
  }
}

List<TableModel> table = [
  TableModel(
    title: 'Color',
    child: const ColorPickerButton(),
  ),
  TableModel(
    title: 'Name of planet',
    child: NameTextField(),
  ),
  TableModel(
    title: 'Radius (km)',
    child: const RadiusTextField(),
  ),
  TableModel(
    title: 'Distance from sun (million km)',
    child: DistanceTextField(),
  ),
  TableModel(
    title: 'Velocity',
    child: VelocityTextField(),
  ),
];
