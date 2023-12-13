import 'package:get_it/get_it.dart';
import 'package:planet_system/bloc/index.dart';

import 'package:planet_system/domain/repositories/new_planet_repository.dart';
import 'package:planet_system/domain/services/services_index.dart';

class SetGetItDependencies {
  void setUpServices() {
    GetIt.I.registerLazySingleton<ScaleService>(ScaleService.new);
  }

  void setUpRepositories() {
    GetIt.instance.registerLazySingleton<NewPlanetRepository>(
        () => NewPlanetRepository(GetIt.I(), GetIt.I()));

    GetIt.instance.registerLazySingleton<PlanetsRepository>(
        () => PlanetsRepository(GetIt.I()));
  }

  void setUpBlocs() {
    GetIt.instance
        .registerFactory<NewPlanetBloc>(() => NewPlanetBloc(GetIt.I()));

    GetIt.instance.registerFactory<PlanetsBloc>(() => PlanetsBloc(GetIt.I()));
  }
}
