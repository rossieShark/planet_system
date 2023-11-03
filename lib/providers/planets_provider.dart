import 'package:flutter/material.dart';
import 'package:planet_system/models/new_planet_model.dart';

class PlanetsProvider extends ChangeNotifier {
  List<NewPlanetModel> _planets = [];
  List<NewPlanetModel> get planets => _planets;

  void addPlanet(NewPlanetModel planet) {
    _planets.add(planet);
  }

  void removePlanet(String name) {
    _planets.removeWhere((item) => item.name == name);
  }
}
