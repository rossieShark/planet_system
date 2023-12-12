import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_state.dart';

class NewPlanetBloc extends Bloc<NewPlanetEvent, NewPlanetState> {
  NewPlanetBloc()
      : super(NewPlanetState(
            color: Colors.red,
            raduis: 20000,
            distance: null,
            velocity: null,
            name: null,
            isValid: true)) {
    on<ChangeColorEvent>(_onChangeColor);
    on<ChangeRadiusEvent>(_onChangeRadius);
    on<ChangeDistanceEvent>(_onChangeDistance);
    on<ChangeNameEvent>(_onChangeName);
    on<ChangeVelocityEvent>(_onChangeVelocity);
    on<IsValidEvent>(_emitUpdatedState);
  }
  void _onChangeColor(
      ChangeColorEvent event, Emitter<NewPlanetState> emit) async {
    emit(state.copyWith(color: event.color));
  }

  void _onChangeRadius(
      ChangeRadiusEvent event, Emitter<NewPlanetState> emit) async {
    emit(state.copyWith(raduis: event.radius));
  }

  void _onChangeDistance(
      ChangeDistanceEvent event, Emitter<NewPlanetState> emit) async {
    emit(state.copyWith(distance: event.distance));
  }

  void _onChangeName(
      ChangeNameEvent event, Emitter<NewPlanetState> emit) async {
    emit(state.copyWith(name: event.name));
  }

  void _onChangeVelocity(
      ChangeVelocityEvent event, Emitter<NewPlanetState> emit) async {
    emit(state.copyWith(velocity: event.velocity));
  }

  void _emitUpdatedState(
      IsValidEvent event, Emitter<NewPlanetState> emit) async {
    final isValid = _validate(state);
    emit(state.copyWith(isValid: isValid));
  }

  void _onClearValues(
      ClearValuesEvent event, Emitter<NewPlanetState> emit) async {
    emit(state.copyWith(
        color: Colors.red,
        raduis: 20000,
        distance: null,
        velocity: null,
        name: null,
        isValid: true));
  }

  bool _validate(NewPlanetState state) {
    return state.name != null &&
        state.name != '' &&
        state.distance != null &&
        state.velocity != null &&
        state.raduis != null;
  }

  // bool _isValidName(NewPlanetState state) {
  //   bool isUnique =
  //   return state.name != null && state.name != '';

  // }
}
