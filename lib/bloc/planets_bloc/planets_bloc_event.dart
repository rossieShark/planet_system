import 'package:equatable/equatable.dart';
import 'package:planet_system/domain/models/new_planet_model.dart';

abstract class PlanetsBlocEvent extends Equatable {
  const PlanetsBlocEvent();
}

class LoadPlanetsBlocEvent extends PlanetsBlocEvent {
  const LoadPlanetsBlocEvent();
  @override
  List<Object?> get props => [];
}

class AddPlanetsBlocEvent extends PlanetsBlocEvent {
  final NewPlanetModel planet;
  const AddPlanetsBlocEvent(this.planet);

  @override
  List<Object> get props => [planet];
}

class RemovePlanetsBlocEvent extends PlanetsBlocEvent {
  final String name;
  const RemovePlanetsBlocEvent(this.name);

  @override
  List<Object> get props => [name];
}

class RemoveAllPlanetsBlocEvent extends PlanetsBlocEvent {
  const RemoveAllPlanetsBlocEvent();

  @override
  List<Object> get props => [];
}
