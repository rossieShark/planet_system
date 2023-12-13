import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/providers/provider_index.dart';
import 'package:planet_system/services/services_index.dart';

import 'package:planet_system/ui/widgets/widgets_index.dart';

class DistanceTextField extends StatefulWidget {
  const DistanceTextField({super.key});

  @override
  State<DistanceTextField> createState() => _DistanceTextFieldState();
}

class _DistanceTextFieldState extends State<DistanceTextField> {
  final TextEditingController _distanceController = TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    final newPlanetBloc = context.read<NewPlanetBloc>();
    return CustomTextField(
      controller: _distanceController,
      errorText: context.watch<NewPlanetBloc>().state.distance.$2,
      onSubmitted: (value) {
        newPlanetBloc
            .add(ChangeDistanceEvent(distance: parseToDoubleOrNull(value)));
        // updateErrorText(value);
      },
    );
  }

  // void updateErrorText(String value) {
  //   final uniqueService = UniqueService();

  //   if (value.isEmpty || !uniqueService.isUniqueDistance(double.parse(value))) {
  //     setState(() {
  //       errorText = 'Distances intersect';
  //     });
  //     addToProvider();
  //   } else {
  //     setState(() {
  //       errorText = null;
  //     });
  //     addToProvider();
  //   }
  // }

  // void addToProvider() {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     context
  //         .read<TextFieldsProvider>()
  //         .addController(_distanceController, errorText == null);
  //   });
  // }

  @override
  void dispose() {
    _distanceController.dispose();
    super.dispose();
  }

  double? parseToDoubleOrNull(String input) {
    try {
      // Attempt to parse the string to double
      double result = double.parse(input);

      // Return the parsed double if successful
      return result;
    } catch (e) {
      // Return null if parsing fails
      return null;
    }
  }
}
