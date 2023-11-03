import 'package:flutter/material.dart';
import 'package:planet_system/models/new_planet_model.dart';

class NewPlanetService {
  var _model = NewPlanetModel(
      color: Colors.red, raduis: 100, distance: 20, velocity: 0.5);
  NewPlanetModel get model => _model;

  void changeColor(Color color) {
    _model = model.copyWith(color: color);
  }

  void changeRadius(double radius) {
    _model = model.copyWith(raduis: radius);
  }

  void changeDistance(int distance) {
    _model = model.copyWith(distance: distance);
  }

  void changeVelocity(double velocity) {
    _model = model.copyWith(velocity: velocity);
  }
}
