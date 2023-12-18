import 'package:flutter/material.dart';
import 'package:planet_system/bloc/index.dart';
import 'package:planet_system/domain/services/services_index.dart';
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
            .add(ChangeDistanceEvent(distance: value.parseToDoubleOrNull()));
      },
    );
  }
}
