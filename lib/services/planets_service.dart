import 'package:planet_system/models/new_planet_model.dart';
import 'package:planet_system/providers/planets_provider.dart';

class PlanetService {
//  final _planetsDataProvider = PlanetsDataProvider();
  List<NewPlanetModel> _planets = [];
  List<NewPlanetModel> get planets => _planets;

  void addPlanet(NewPlanetModel planet) {
    _planets.add(planet);
    // _planetsDataProvider.savePlanets(_planets);
  }

  void removePlanetWithName(String name) {
    _planets.removeWhere((item) => item.name == name);
    // _planetsDataProvider.savePlanets(_planets);
  }

  // Future<void> initialize() async {
  //   _planets = await _planetsDataProvider.loadPlanets();
  // }
}
