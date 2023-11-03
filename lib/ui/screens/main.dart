import 'package:flutter/material.dart';
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
    return ChangeNotifierProvider(
      create: (_) => NewPlanetProvider(),
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
