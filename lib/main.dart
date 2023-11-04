import 'package:flutter/material.dart';
import 'package:planet_system/providers/planets_provider.dart';
import 'package:planet_system/providers/text_fields_provider.dart';
import 'package:planet_system/ui/screens/main_page/main_page.dart';
import 'package:planet_system/providers/new_planet_provider.dart';
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
        ChangeNotifierProvider(
          create: (_) => NewPlanetProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlanetsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TextFieldsProvider(),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
