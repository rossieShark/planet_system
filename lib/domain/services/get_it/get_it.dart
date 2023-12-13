import 'package:get_it/get_it.dart';
import 'package:planet_system/bloc/index.dart';
import 'package:planet_system/database/planets_db.dart';

import 'package:planet_system/domain/repositories/new_planet_repository.dart';
import 'package:planet_system/domain/services/services_index.dart';

class SetGetItDependencies {
  void setUpServices() {
    GetIt.I.registerLazySingleton<ScaleService>(ScaleService.new);
  }

  void setUpDatabase() {
    GetIt.I.registerLazySingleton<PlanetsDatabase>(PlanetsDatabase.new);
  }

  void setUpRepositories() {
    GetIt.instance.registerLazySingleton<NewPlanetRepository>(
        () => NewPlanetRepository(GetIt.instance.get(), GetIt.instance.get()));

    GetIt.instance.registerLazySingleton<PlanetsRepository>(
        () => PlanetsRepository(GetIt.instance.get()));
  }

  void setUpBlocs() {
    GetIt.instance.registerFactory<NewPlanetBloc>(
        () => NewPlanetBloc(GetIt.instance.get()));

    GetIt.instance
        .registerFactory<PlanetsBloc>(() => PlanetsBloc(GetIt.instance.get()));
  }
}
