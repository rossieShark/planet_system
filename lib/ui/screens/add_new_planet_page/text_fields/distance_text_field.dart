import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';

import 'package:planet_system/ui/widgets/widgets_index.dart';

class DistanceTextField extends StatefulWidget {
  const DistanceTextField({super.key});

  @override
  State<DistanceTextField> createState() => _DistanceTextFieldState();
}

class _DistanceTextFieldState extends State<DistanceTextField> {
  final TextEditingController _distanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPlanetBloc = context.read<NewPlanetBloc>();
    return CustomTextField(
      controller: _distanceController,
      errorText: context.watch<NewPlanetBloc>().state.distance.$2,
      onSubmitted: (value) {
        newPlanetBloc
            .add(ChangeDistanceEvent(distance: parseToDoubleOrNull(value)));
      },
    );
  }

  double? parseToDoubleOrNull(String input) {
    try {
      double result = double.parse(input);
      return result;
    } catch (e) {
      return null;
    }
  }
}
