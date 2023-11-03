import 'package:flutter/material.dart';
import 'package:planet_system/services/new_planet_service.dart';

class _NewPlanetProviderState {
  final Color color;
  final double raduis;
  final int distance;
  final double velocity;
  _NewPlanetProviderState({
    required this.color,
    required this.raduis,
    required this.distance,
    required this.velocity,
  });
}

class NewPlanetProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = _NewPlanetProviderState(
      color: Colors.red, raduis: 100, distance: 20, velocity: 0.5);
  // ignore: library_private_types_in_public_api
  _NewPlanetProviderState get state => _state;
  final _newPlaneService = NewPlanetService();

  void changeColor(Color color) {
    _newPlaneService.changeColor(color);
    _updateState();
  }

  void changeRadius(double radius) {
    _newPlaneService.changeRadius(radius);
    _updateState();
  }

  void changeDistance(int distance) {
    _newPlaneService.changeDistance(distance);
    _updateState();
  }

  void changeVelocity(double velocity) {
    _newPlaneService.changeVelocity(velocity);
    _updateState();
  }

  void _updateState() {
    final model = _newPlaneService.model;
    _state = _NewPlanetProviderState(
      color: model.color,
      raduis: model.raduis,
      distance: model.distance,
      velocity: model.velocity,
    );
    notifyListeners();
  }
}
