import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../free_game.dart';
import '../genres.dart';
import '../../services/service.dart';

part 'free_games_event.dart';
part 'free_games_state.dart';

const _service = FreeGamesService();

class MostRecentBloc extends Bloc<FreeGamesEvent, FreeGamesState> {
  MostRecentBloc() : super(FreeGamesLoadingState()) {
    on<FreeGamesFetchEvent>((event, emit) async {
      final results = await event.future;
      emit(FreeGamesLoadedState(freeGames: results));
    });
  }
}

class FreeGamesBloc extends Bloc<FreeGamesEvent, FreeGamesState> {
  final _maxNumberOfGames = 10;

  bool _isFirstLoad = true;
  int _lastItemIndex = 0;
  List<FreeGame> _freeGames = [];
  Future<List<FreeGame>> _lastRequest = fetchAllEvent.future;

  FreeGamesBloc() : super(FreeGamesLoadingState()) {
    on<FreeGamesFetchEvent>((event, emit) async {
      var results = await event.future;
      _freeGames = results;
      final isDifferentRequest = _lastRequest != event.future;
      _isFirstLoad = isDifferentRequest;

      // Implementing pagination since the API doesn't support it
      if (_freeGames.length > _maxNumberOfGames) {
        final offset = _isFirstLoad ? 0 : _lastItemIndex;
        results = _freeGames.sublist(offset, _maxNumberOfGames + offset);
        _lastItemIndex = results.indexOf(results.last);
      }

      _lastRequest = event.future;
      _isFirstLoad = false;
      emit(FreeGamesLoadedState(freeGames: results));
    });
  }
}

final fetchAllEvent = FreeGamesFetchEvent(future: _service.getGames());
FreeGamesFetchEvent fetchMostRecent ({Genre genre = Genre.all}) => FreeGamesFetchEvent(future: _service.mostRecentGames(genre));
FreeGamesFetchEvent fetchByGenre (Genre genre) => FreeGamesFetchEvent(future: _service.getGamesByGenre(genre));
FreeGamesFetchEvent fetchUsingSortRule (SortRule sortRule) => FreeGamesFetchEvent(future: _service.getGamesSortedByRule(sortRule));
FreeGamesFetchEvent fetchForPlatform (String platform) => FreeGamesFetchEvent(future: _service.getGamesForPlatform(platform));