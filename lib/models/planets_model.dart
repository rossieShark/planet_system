// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Planets {
  final Widget planet;
  final double distance;
  final double vilocity;
  Planets({
    required this.planet,
    required this.distance,
    required this.vilocity,
  });

  Planets copyWith({
    Widget? planet,
    double? distance,
    double? vilocity,
  }) {
    return Planets(
      planet: planet ?? this.planet,
      distance: distance ?? this.distance,
      vilocity: vilocity ?? this.vilocity,
    );
  }
}
