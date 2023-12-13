import 'package:planet_system/database/planets_db.dart';
import 'package:planet_system/domain/models/new_planet_model.dart';

class PlanetsRepository {
  final PlanetsDatabase _database;
  PlanetsRepository(this._database);
  Future<List<NewPlanetModel>> loadPlanets() async {
    return await _database.loadPlanets();
  }

  Future<List<NewPlanetModel>> addNewPlanet(NewPlanetModel planet) async {
    List<NewPlanetModel> planets = await loadPlanets();
    planets.add(planet);
    _database.savePlanets(planets);
    return await loadPlanets();
  }

  Future<List<NewPlanetModel>> removePlanet(String name) async {
    List<NewPlanetModel> planets = await loadPlanets();
    planets.removeWhere((planet) => planet.name == name);
    _database.savePlanets(planets);
    return await loadPlanets();
  }

  Future<List<NewPlanetModel>> removeAllPlanets() async {
    _database.savePlanets([]);
    return [];
  }
}
