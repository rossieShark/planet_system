import 'dart:convert';

import 'package:planet_system/domain/models/new_planet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanetsDatabase {
  final sharedPreferences = SharedPreferences.getInstance();

  Future<void> savePlanets(List<NewPlanetModel> planets) async {
    final prefs = await SharedPreferences.getInstance();
    final planetsJson = planets.map((planet) => planet.toJson()).toList();
    final planetsString = jsonEncode(planetsJson);
    prefs.setString('planets', planetsString);
  }

  Future<List<NewPlanetModel>> loadPlanets() async {
    final prefs = await SharedPreferences.getInstance();
    final planetsString = prefs.getString('planets');
    if (planetsString == null) {
      return [];
    }
    final planetsJson = jsonDecode(planetsString);
    return planetsJson
        .map<NewPlanetModel>((json) => NewPlanetModel.fromJson(json))
        .toList();
  }
}
