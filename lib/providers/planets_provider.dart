// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:planet_system/models/new_planet_model.dart';
import 'package:planet_system/services/planets_service.dart';

class _PlanetsModelState {
  List<NewPlanetModel> planets;
  _PlanetsModelState({
    required this.planets,
  });
}

class PlanetsProvider extends ChangeNotifier {
  final _planetsService = PlanetService();

  // var _state = _PlanetsModelState(planets: []);
  // _PlanetsModelState get state => _state;

  // PlanetsProvider() {
  //   loadValue();
  // }
  // void loadValue() async {
  //   await _planetsService.initialize();
  //   _updateState;
  // }

  List<NewPlanetModel> _planets = [];
  List<NewPlanetModel> get planets => _planets;

  void addPlanet(NewPlanetModel planet) {
    _planets.add(planet);
    notifyListeners();
  }

  void removePlanetWithName(String name) {
    _planets.removeWhere((item) => item.name == name);
    notifyListeners();
  }
  // void addPlanet(NewPlanetModel planet) {
  //   _planetsService.addPlanet(planet);
  //   _updateState;
  // }

  // void removePlanetWithName(String name) {
  //   _planetsService.removePlanetWithName(name);
  //   _updateState;
  // }

  void _updateState() {
    final planets = _planetsService.planets;
    _state = _PlanetsModelState(
      planets: planets,
    );
    notifyListeners();
  }
}

// class PlanetsDataProvider {
//   final sharedPreferences = SharedPreferences.getInstance();

//   Future<void> savePlanets(List<NewPlanetModel> planets) async {
//     final prefs = await SharedPreferences.getInstance();
//     final planetsJson = planets.map((planet) => planet.toJson()).toList();
//     final planetsString = jsonEncode(planetsJson);
//     prefs.setString('planets', planetsString);
//   }

//   Future<List<NewPlanetModel>> loadPlanets() async {
//     final prefs = await SharedPreferences.getInstance();
//     final planetsString = prefs.getString('planets');
//     if (planetsString == null) {
//       return []; // Return an empty list if the data is not found
//     }
//     final planetsJson = jsonDecode(planetsString);
//     return planetsJson
//         .map<NewPlanetModel>((json) => NewPlanetModel.fromJson(json))
//         .toList();
//   }
//}
