// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class NewPlanetModel {
  final Color? color;
  final double? raduis;
  final double? distance;
  final double? velocity;
  final String? name;

  NewPlanetModel(
      {required this.color,
      required this.raduis,
      required this.distance,
      required this.velocity,
      required this.name});

  NewPlanetModel copyWith(
      {Color? color,
      double? raduis,
      double? distance,
      double? velocity,
      String? name}) {
    return NewPlanetModel(
      color: color ?? this.color,
      raduis: raduis ?? this.raduis,
      distance: distance ?? this.distance,
      velocity: velocity ?? this.velocity,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color?.value,
      'raduis': raduis,
      'distance': distance,
      'velocity': velocity,
      'name': name,
    };
  }

  factory NewPlanetModel.fromMap(Map<String, dynamic> map) {
    return NewPlanetModel(
      color: map['color'] != null ? Color(map['color'] as int) : null,
      raduis: map['raduis'] != null ? map['raduis'] as double : null,
      distance: map['distance'] != null ? map['distance'] as double : null,
      velocity: map['velocity'] != null ? map['velocity'] as double : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewPlanetModel.fromJson(String source) =>
      NewPlanetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
