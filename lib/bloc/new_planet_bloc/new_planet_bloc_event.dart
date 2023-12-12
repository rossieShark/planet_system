// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class NewPlanetEvent {}

class ChangeColorEvent extends NewPlanetEvent {
  final Color color;
  ChangeColorEvent({
    required this.color,
  });
}

class ChangeRadiusEvent extends NewPlanetEvent {
  final double radius;
  ChangeRadiusEvent({
    required this.radius,
  });
}

class ChangeDistanceEvent extends NewPlanetEvent {
  final double distance;
  ChangeDistanceEvent({
    required this.distance,
  });
}

class ChangeVelocityEvent extends NewPlanetEvent {
  final double velocity;
  ChangeVelocityEvent({
    required this.velocity,
  });
}

class ChangeNameEvent extends NewPlanetEvent {
  final String name;
  ChangeNameEvent({
    required this.name,
  });
}

class ClearValuesEvent extends NewPlanetEvent {
  ClearValuesEvent();
}

class IsValidEvent extends NewPlanetEvent {
  IsValidEvent();
}
