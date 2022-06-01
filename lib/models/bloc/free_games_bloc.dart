import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../free_game.dart';
import '../genres.dart';
import '../../services/service.dart';

part 'free_games_event.dart';
part 'free_games_state.dart';

final _service = FreeGamesService();

class MostRecentBloc extends Bloc<FreeGamesEvent, FreeGamesState> {
  MostRecentBloc() : super(FreeGamesLoadingState()) {
    on<FreeGamesFetchEvent>((event, emit) async {
      final results = await event.future;
      emit(FreeGamesLoadedState(freeGames: results));
    });
  }
}

class FreeGamesBloc extends Bloc<FreeGamesEvent, FreeGamesState> {
  FreeGamesBloc() : super(FreeGamesLoadingState()) {
    on<FreeGamesFetchEvent>((event, emit) async {
      var results = await event.future;
      emit(FreeGamesLoadedState(freeGames: results));
    });
  }
}

final fetchAllEvent = FreeGamesFetchEvent(future: _service.getGames());
FreeGamesFetchEvent fetchMostRecent({Genre genre = Genre.all}) => FreeGamesFetchEvent(future: _service.mostRecentGames(genre));
FreeGamesFetchEvent fetchByGenre(Genre genre) => FreeGamesFetchEvent(future: _service.getGamesByGenre(genre));
FreeGamesFetchEvent fetchUsingSortRule(SortRule sortRule) => FreeGamesFetchEvent(future: _service.getGamesSortedByRule(sortRule));
FreeGamesFetchEvent fetchForPlatform(String platform) => FreeGamesFetchEvent(future: _service.getGamesForPlatform(platform));