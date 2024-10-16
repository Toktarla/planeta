import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/get_saved_planets_usecase.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/remove_planet_usecase.dart';
import 'package:untitled/features/domain/usecases/planet_usecases/save_planet_usecase.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_event.dart';
import 'package:untitled/features/presentation/bloc/planet/local/local_planet_state.dart';

class LocalPlanetBloc extends Bloc<LocalPlanetEvent, LocalPlanetState> {
  final GetSavedPlanetsUseCase _getSavedPlanetsUseCase;
  final SavePlanetUseCase _savePlanetUseCase;
  final RemovePlanetUseCase _removePlanetUseCase;

  LocalPlanetBloc(this._getSavedPlanetsUseCase, this._savePlanetUseCase,
      this._removePlanetUseCase)
      : super(const LocalPlanetLoading()) {
    on<GetSavedPlanetsEvent>(onGetSavedPlanets);
    on<RemovePlanetEvent>(onRemovePlanet);
    on<SavePlanetEvent>(onSavePlanet);
  }

  onGetSavedPlanets(GetSavedPlanetsEvent event, Emitter<LocalPlanetState> emit) async {
      final planets = await _getSavedPlanetsUseCase.call();
      emit(LocalPlanetDone(planets));

  }

  onRemovePlanet(RemovePlanetEvent event, Emitter<LocalPlanetState> emit) async {

    await _removePlanetUseCase(params: event.planetEntity);
    final planets = await _getSavedPlanetsUseCase();
    emit(LocalPlanetDone(planets));

  }

  onSavePlanet(SavePlanetEvent event, Emitter<LocalPlanetState> emit) async {
    await _savePlanetUseCase(params: event.planetEntity);
    final planets = await _getSavedPlanetsUseCase();
    emit(LocalPlanetDone(planets));
  }
}
