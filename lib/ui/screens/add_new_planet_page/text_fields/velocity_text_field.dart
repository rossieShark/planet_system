import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';

import 'package:planet_system/ui/widgets/widgets_index.dart';

class VelocityTextField extends StatefulWidget {
  const VelocityTextField({super.key});

  @override
  State<VelocityTextField> createState() => _VelocityTextFieldState();
}

class _VelocityTextFieldState extends State<VelocityTextField> {
  final TextEditingController _velocityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPlanetBloc = context.read<NewPlanetBloc>();
    return CustomTextField(
      controller: _velocityController,
      errorText: context.watch<NewPlanetBloc>().state.velocity.$2,
      onSubmitted: (value) {
        newPlanetBloc
            .add(ChangeVelocityEvent(velocity: _parseToDoubleOrNull(value)));
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
