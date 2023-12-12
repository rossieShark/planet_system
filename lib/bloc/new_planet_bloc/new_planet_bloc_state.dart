// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NewPlanetState {
  final Color? color;
  final double? raduis;
  final double? distance;
  final double? velocity;
  final String? name;
  final bool isValid;
  NewPlanetState(
      {required this.color,
      required this.raduis,
      required this.distance,
      required this.velocity,
      required this.isValid,
      required this.name});

  NewPlanetState copyWith(
      {Color? color,
      double? raduis,
      double? distance,
      double? velocity,
      String? name,
      bool? isValid}) {
    return NewPlanetState(
        color: color ?? this.color,
        raduis: raduis ?? this.raduis,
        distance: distance ?? this.distance,
        velocity: velocity ?? this.velocity,
        name: name ?? this.name,
        isValid: isValid ?? this.isValid);
  }
}
