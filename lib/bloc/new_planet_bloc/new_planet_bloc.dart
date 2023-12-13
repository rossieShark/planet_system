import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_state.dart';
import 'package:planet_system/services/new_planet_repository.dart';

class NewPlanetBloc extends Bloc<NewPlanetEvent, NewPlanetState> {
  final NewPlanetRepository _repository;
  NewPlanetBloc(this._repository)
      : super(NewPlanetState(
            color: Colors.red,
            raduis: (20000, null, true),
            distance: (null, null, true),
            velocity: (null, null, true),
            name: (null, null, true),
            isValid: false)) {
    on<ChangeColorEvent>(_onChangeColor);
    on<ChangeRadiusEvent>(_onChangeRadius);
    on<ChangeDistanceEvent>(_onChangeDistance);
    on<ChangeNameEvent>(_onChangeName);
    on<ChangeVelocityEvent>(_onChangeVelocity);
    on<IsValidEvent>(_emitUpdatedState);
    on<ClearValuesEvent>(_onClearValues);
  }
  void _onChangeColor(
      ChangeColorEvent event, Emitter<NewPlanetState> emit) async {
    emit(state.copyWith(color: event.color));
  }

  void _onChangeRadius(
      ChangeRadiusEvent event, Emitter<NewPlanetState> emit) async {
    String? errorText;
    final isValid = _repository.isRadiusValid(event.radius);
    if (isValid) {
      errorText = null;
    } else {
      errorText = 'Invalid radius';
    }
    emit(state.copyWith(raduis: (event.radius, errorText, isValid)));
  }

  void _onChangeDistance(
      ChangeDistanceEvent event, Emitter<NewPlanetState> emit) async {
    String? errorText;
    final isValid = await _repository.isUniqueDistance(event.distance);
    if (isValid) {
      errorText = null;
    } else {
      errorText = 'Invalid distance';
    }
    emit(state.copyWith(distance: (event.distance, errorText, isValid)));
  }

  void _onChangeName(
      ChangeNameEvent event, Emitter<NewPlanetState> emit) async {
    String? errorText;
    final isValid = await _repository.isUniqueName(event.name);
    if (isValid) {
      errorText = null;
    } else {
      errorText = 'Please enter unique name';
    }
    emit(state.copyWith(name: (event.name, errorText, isValid)));
  }

  void _onChangeVelocity(
      ChangeVelocityEvent event, Emitter<NewPlanetState> emit) async {
    String? errorText;
    final isValid = _repository.isVelocityValid(event.velocity);
    if (isValid) {
      errorText = null;
    } else {
      errorText = 'Invalid velocity';
    }
    emit(state.copyWith(velocity: (event.velocity, errorText, isValid)));
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
        raduis: (20000, null, true),
        distance: (null, null, true),
        velocity: (null, null, true),
        name: (null, null, true),
        isValid: true));
  }

  bool _validate(NewPlanetState state) {
    return state.name.$3 &&
        state.distance.$3 &&
        state.velocity.$3 &&
        state.raduis.$3;
  }
}
