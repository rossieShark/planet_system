import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/providers/provider_index.dart';
import 'package:planet_system/services/services_index.dart';
import 'package:planet_system/ui/widgets/widgets_index.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPlanetBloc = context.read<NewPlanetBloc>();
    return CustomTextField(
      textInputType: TextInputType.name,
      errorText: context.watch<NewPlanetBloc>().state.name.$2,
      controller: _nameTextController,
      onSubmitted: (value) {
        newPlanetBloc.add(ChangeNameEvent(name: value));
        // updateErrorText(value);
      },
    );
  }

  // void updateErrorText(String value) {
  //   final uniqueService = UniqueService();

  //   if (value.isEmpty || !uniqueService.isUniqueName(value)) {
  //     setState(() {
  //       errorText = 'Name is not unique or empty';
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
  //         .addController(_nameTextController, errorText == null);
  //   });
  // }

  @override
  void dispose() {
    _nameTextController.dispose();
    super.dispose();
  }
}
