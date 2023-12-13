import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:planet_system/bloc/planets_bloc/planets_bloc_event.dart';
import 'package:planet_system/bloc/planets_bloc/planets_bloc_state.dart';
import 'package:planet_system/domain/repositories/planets_repository.dart';

class PlanetsBloc extends Bloc<PlanetsBlocEvent, PlanetsState> {
  final PlanetsRepository _repository;
  PlanetsBloc(this._repository) : super(const PlanetsState.empty()) {
    on<LoadPlanetsBlocEvent>(_onLoadPlanets);
    on<AddPlanetsBlocEvent>(_onAddPlanet);
    on<RemovePlanetsBlocEvent>(_onRemovePlanet);
    on<RemoveAllPlanetsBlocEvent>(_onRemoveAll);
  }
  void _onLoadPlanets(
      LoadPlanetsBlocEvent event, Emitter<PlanetsState> emit) async {
    try {
      final planets = await _repository.loadPlanets();
      if (planets.isEmpty) {
        emit(const PlanetsState.empty());
      } else {
        emit(PlanetsState.loaded(planets: planets));
      }
    } catch (e) {
      emit(const PlanetsState.error());
      print('Loading data error - $e');
    }
  }

  void _onAddPlanet(
      AddPlanetsBlocEvent event, Emitter<PlanetsState> emit) async {
    final planets = await _repository.addNewPlanet(event.planet);
    emit(PlanetsState.loaded(planets: planets));
  }

  void _onRemovePlanet(
      RemovePlanetsBlocEvent event, Emitter<PlanetsState> emit) async {
    final planets = await _repository.removePlanet(event.name);
    if (planets.isEmpty) {
      emit(const PlanetsState.empty());
    } else {
      emit(PlanetsState.loaded(planets: planets));
    }
  }

  void _onRemoveAll(
      RemoveAllPlanetsBlocEvent event, Emitter<PlanetsState> emit) async {
    await _repository.removeAllPlanets();
    emit(const PlanetsState.empty());
  }
}
