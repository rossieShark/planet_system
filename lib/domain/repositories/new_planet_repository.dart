import 'package:planet_system/domain/repositories/planets_repository.dart';
import 'package:planet_system/domain/services/scale_service.dart';

class NewPlanetRepository {
  final PlanetsRepository _planets;
  final ScaleService _scaleService;
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

  bool isRadiusValid(double? radius) {
    if (radius == null || radius == 0) {
      return false;
    }
    const minRadius = 1000;
    final maxRadius = _scaleService.sunRealRadius;
    return radius > minRadius && radius < maxRadius;
  }

  Future<bool> isUniqueDistance(double? distance) async {
    final sunRadius = _scaleService.sunScaleRadius;
    bool isUnique = true;
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
}
