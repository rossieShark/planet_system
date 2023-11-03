// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NewPlanetModel {
  final Color color;
  final double raduis;
  final int distance;
  final double velocity;
  String? name;

  NewPlanetModel(
      {required this.color,
      required this.raduis,
      required this.distance,
      required this.velocity,
      this.name});

  NewPlanetModel copyWith({
    Color? color,
    double? raduis,
    int? distance,
    double? velocity,
  }) {
    return NewPlanetModel(
      color: color ?? this.color,
      raduis: raduis ?? this.raduis,
      distance: distance ?? this.distance,
      velocity: velocity ?? this.velocity,
    );
  }
}
