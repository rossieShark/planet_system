import 'package:planet_system/services/planets_repository.dart';
import 'package:planet_system/services/scale_service.dart';

class NewPlanetRepository {
  PlanetsRepository _planets;
  ScaleService _scaleService;
  NewPlanetRepository(this._scaleService, this._planets);

  Future<bool> isUniqueName(String? name) async {
    if (name == null || name.trim() == '') {
      return false;
    }
    final planets = await _planets.loadPlanets();
    final isUniqueName =
        planets.every((existingPlanet) => existingPlanet.name != name);
    return isUniqueName;
  }

  bool isVelocityValid(double? velocity) {
    if (velocity == null || velocity == 0) {
      return false;
    }
    const maxVelocity = 30;
    return velocity > 0 && velocity <= maxVelocity;
  }

  bool isRadiusValid(String eventValue) {
    final radius = _parseToDoubleOrNull(eventValue);
    if (radius == null || radius == 0) {
      return false;
    }
    const minRadius = 1000;
    final maxRadius = _scaleService.sunRealRadius;
    return radius > minRadius && radius < maxRadius;
  }

  Future<bool> isUniqueDistance(String eventValue) async {
    final sunRadius = _scaleService.sunScaleRadius;
    bool isUnique = true;
    final distance = _parseToDoubleOrNull(eventValue);
    if (distance == 0 || distance == null) {
      return false;
    }

    final dist = distance + sunRadius;
    final planets = await _planets.loadPlanets();

    if (planets.isNotEmpty) {
      for (var existingPlanet in planets) {
        if (existingPlanet.distance == dist ||
            (existingPlanet.distance! - existingPlanet.raduis! < dist &&
                dist < existingPlanet.distance! + existingPlanet.raduis!) ||
            (dist - existingPlanet.raduis! < existingPlanet.distance! &&
                existingPlanet.distance! < dist + existingPlanet.raduis!)) {
          isUnique = false;
          break;
        }
        return isUnique;
      }
    }
    return isUnique;
  }

  double? _parseToDoubleOrNull(String input) {
    try {
      double result = double.parse(input);

      return result;
    } catch (e) {
      return null;
    }
  }
}
