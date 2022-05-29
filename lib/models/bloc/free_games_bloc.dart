import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../free_game.dart';
import '../genres.dart';
import '../../services/service.dart';

part 'free_games_event.dart';
part 'free_games_state.dart';

class MostRecentBloc extends Bloc<FreeGamesEvent, FreeGamesState> {
  final Service service;

  MostRecentBloc({this.service = const FreeGamesService()}) : super(FreeGamesLoadingState()) {
    on<FreeGamesFetchMostRecentEvent>((event, emit) async {
      final results = await service.mostRecentGames;
      emit(FreeGamesLoadedState(freeGames: results));
    });
  }
}

class FreeGamesBloc extends Bloc<FreeGamesEvent, FreeGamesState> {
  final Service service;

  FreeGamesBloc({this.service = const FreeGamesService()}) : super(FreeGamesLoadingState()) {
    Future<List<FreeGame>>? future;

    on<FreeGamesFetchEvent>((event, emit) async {
      if (event is FreeGamesFetchAllEvent) {
        future = service.getGames();
      }

      if (event is FreeGamesFetchByCategoryEvent) {
        future = service.getGamesByGenre(event.genre);
      }

      if (event is FreeGamesFetchForPlatformEvent) {
        future = service.getGamesForPlatform(event.platform);
      }

      if (event is FreeGamesFetchUsingSortRuleEvent) {
        future = service.getGamesSortedByRule(event.sortRule);
      }

      final results = await future ?? [];
      emit(FreeGamesLoadedState(freeGames: results));
    });
  }
}