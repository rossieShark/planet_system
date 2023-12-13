import 'package:flutter/material.dart';
import 'package:planet_system/bloc/index.dart';
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
    final newPlanetBloc = context.read<NewPlanetBloc>();
    return CustomTextField(
      controller: _radiusController,
      errorText: context.watch<NewPlanetBloc>().state.raduis.$2,
      onSubmitted: (value) {
        newPlanetBloc
            .add(ChangeRadiusEvent(radius: _parseToDoubleOrNull(value)));
      },
    );
  }

  double? _parseToDoubleOrNull(String input) {
    try {
      double result = double.parse(input);

      return result;
    } catch (e) {
      return null;
    }
  }
}
