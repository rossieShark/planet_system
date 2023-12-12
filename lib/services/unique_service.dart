import 'package:planet_system/services/services_index.dart';

class UniqueService {
  final _planets = PlanetService().planets;
  bool isUniqueName(String name) {
    final isUniqueName =
        _planets.every((existingPlanet) => existingPlanet.name != name);

    return isUniqueName;
  }

  bool isVelocityValid(double velocity) {
    const maxVelocity = 30;
    return velocity > 0 && velocity <= maxVelocity;
  }

  bool isRadiusValid(double radius) {
    final scaleService = ScaleService();
    const minRadius = 1000;
    final maxRadius = scaleService.sunRealRadius;
    return radius > minRadius && radius < maxRadius;
  }

  bool isUniqueDistance(double distance) {
    final sunRadius = ScaleService().sunScaleRadius;
    bool isUnique = true;
    final dist = distance + sunRadius;
    if (_planets.isNotEmpty) {
      for (var existingPlanet in _planets) {
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
