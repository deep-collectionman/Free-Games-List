import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../free_game.dart';
import '../../services/service.dart';

part 'free_games_event.dart';
part 'free_games_state.dart';

class FreeGamesBloc extends Bloc<FreeGamesEvent, FreeGamesState> {
  final _service = FreeGamesService();

  FreeGamesBloc() : super(FreeGamesInitialState()) {
    Future<List<FreeGame>>? future;

    on<FreeGamesFetchEvent>((event, emit) async {
      if (event is FreeGamesFetchMostRecentEvent) {
        future = _service.mostRecentGames;
      }

      if (event is FreeGamesFetchAllEvent) {
        future = _service.getGames();
      }

      if (event is FreeGamesFetchByCategoryEvent) {
        future = _service.getGamesByCategory(event.category);
      }

      if (event is FreeGamesFetchForPlatformEvent) {
        future = _service.getGamesForPlatform(event.platform);
      }

      if (event is FreeGamesFetchUsingSortRuleEvent) {
        future = _service.getGamesSortedByRule(event.sortRule);
      }

      final results = await future ?? [];
      emit(FreeGamesLoadedState(freeGames: results));
    });
  }
}