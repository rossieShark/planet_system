import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    final newPlanetProvider = context.read<NewPlanetProvider>();
    return CustomTextField(
      controller: _distanceController,
      errorText: errorText,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          newPlanetProvider.changeDistance(double.parse(value));
        }
        updateErrorText(value);
      },
    );
  }

  void updateErrorText(String value) {
    final uniqueService = UniqueService();

    if (value.isEmpty || !uniqueService.isUniqueDistance(double.parse(value))) {
      setState(() {
        errorText = 'Distances intersect';
      });
      addToProvider();
    } else {
      setState(() {
        errorText = null;
      });
      addToProvider();
    }
  }

  void addToProvider() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .read<TextFieldsProvider>()
          .addController(_distanceController, errorText == null);
    });
  }

  @override
  void dispose() {
    _distanceController.dispose();
    super.dispose();
  }
}