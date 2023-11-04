import 'package:flutter/material.dart';
import 'package:planet_system/services/new_planet_service.dart';

class _NewPlanetProviderState {
  final Color? color;
  final double? raduis;
  final double? distance;
  final double? velocity;
  final String? name;
  _NewPlanetProviderState(
      {required this.color,
      required this.raduis,
      required this.distance,
      required this.velocity,
      required this.name});
}

class NewPlanetProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = _NewPlanetProviderState(
      color: Colors.red,
      raduis: 20000,
      distance: null,
      velocity: null,
      name: null);
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

  void changeDistance(double distance) {
    _newPlaneService.changeDistance(distance);
    _updateState();
  }

  void changeVelocity(double velocity) {
    _newPlaneService.changeVelocity(velocity);
    _updateState();
  }

  void changeName(String name) {
    _newPlaneService.changeName(name);
    _updateState();
  }

  void _updateState() {
    final model = _newPlaneService.model;
    _state = _NewPlanetProviderState(
        color: model.color!,
        raduis: model.raduis,
        distance: model.distance,
        velocity: model.velocity,
        name: model.name);
    notifyListeners();
  }
}
