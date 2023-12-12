import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/planets_bloc/planets_bloc.dart';
import 'package:planet_system/database/planets_db.dart';

import 'package:planet_system/services/planets_repository.dart';
import 'package:planet_system/ui/screens/main_page/main_page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const PlanetSystem());
}

class PlanetSystem extends StatelessWidget {
  const PlanetSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => NewPlanetBloc(),
        ),
        BlocProvider(
          create: (_) => PlanetsBloc(PlanetsRepository(PlanetsDatabase())),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => TextFieldsProvider(),
        // ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
