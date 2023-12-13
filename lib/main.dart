import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:planet_system/bloc/index.dart';
import 'package:planet_system/domain/services/get_it/get_it.dart';
import 'package:planet_system/ui/screens/main_page/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SetGetItDependencies().setUpServices();
  SetGetItDependencies().setUpRepositories();
  SetGetItDependencies().setUpDatabase();
  SetGetItDependencies().setUpBlocs();
  runApp(const PlanetSystem());
}

class PlanetSystem extends StatelessWidget {
  const PlanetSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<NewPlanetBloc>(create: (_) => GetIt.I.get()),
        BlocProvider<PlanetsBloc>(
          create: (_) => GetIt.I.get(),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
