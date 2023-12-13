import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planet_system/domain/models/new_planet_model.dart';
part 'planets_bloc_state.freezed.dart';

@Freezed(equal: false)
class PlanetsState with _$PlanetsState {
  const factory PlanetsState.empty() = EmptyPlanetsState;
  const factory PlanetsState.error() = ErrorPlanetsState;
  const factory PlanetsState.loaded({required List<NewPlanetModel> planets}) =
      LoadedPlanetsState;
}
