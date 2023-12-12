import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/providers/provider_index.dart';
import 'package:planet_system/services/services_index.dart';
import 'package:planet_system/ui/widgets/widgets_index.dart';

class RadiusTextField extends StatefulWidget {
  const RadiusTextField({super.key});

  @override
  State<RadiusTextField> createState() => _RadiusTextFieldState();
}

class _RadiusTextFieldState extends State<RadiusTextField> {
  final TextEditingController _radiusController = TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    final newPlanetBloc = context.read<NewPlanetBloc>();
    return CustomTextField(
      controller: _radiusController,
      errorText: errorText,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          newPlanetBloc.add(ChangeRadiusEvent(radius: double.parse(value)));
        }
        // updateErrorText(value);
      },
    );
  }

  // void updateErrorText(String value) {
  //   final uniqueService = UniqueService();
  //   final sunRadius = ScaleService().sunRealRadius;
  //   if (value.isEmpty || !uniqueService.isRadiusValid(double.parse(value))) {
  //     setState(() {
  //       errorText = 'Enter radius between 1000 - $sunRadius';
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
  //         .addController(_radiusController, errorText == null);
  //   });
  // }

  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }
}
