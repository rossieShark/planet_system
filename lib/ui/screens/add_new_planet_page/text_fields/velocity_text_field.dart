import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/providers/provider_index.dart';
import 'package:planet_system/services/services_index.dart';
import 'package:planet_system/ui/widgets/widgets_index.dart';

class VelocityTextField extends StatefulWidget {
  const VelocityTextField({super.key});

  @override
  State<VelocityTextField> createState() => _VelocityTextFieldState();
}

class _VelocityTextFieldState extends State<VelocityTextField> {
  final TextEditingController _velocityController = TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    final newPlanetBloc = context.read<NewPlanetBloc>();
    return CustomTextField(
      controller: _velocityController,
      errorText: errorText,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          newPlanetBloc.add(ChangeVelocityEvent(velocity: double.parse(value)));
        }
        // updateErrorText(value);
      },
    );
  }

  // void updateErrorText(String value) {
  //   final uniqueService = UniqueService();

  //   if (value.isEmpty || !uniqueService.isVelocityValid(double.parse(value))) {
  //     setState(() {
  //       errorText = 'Enter velocity between 1 - 30';
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
  //         .addController(_velocityController, errorText == null);
  //   });
  // }

  @override
  void dispose() {
    _velocityController.dispose();
    super.dispose();
  }
}
