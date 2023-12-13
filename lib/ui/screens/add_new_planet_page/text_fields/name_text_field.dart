import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';

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
      },
    );
  }
}
