part of 'free_games_bloc.dart';

abstract class FreeGamesEvent extends Equatable {
  const FreeGamesEvent();

  @override
  List<Object> get props => [];
}

class FreeGamesFetchEvent extends FreeGamesEvent {
  final Future<List<FreeGame>> future;

  const FreeGamesFetchEvent({required this.future});

  @override
  List<Object> get props => [future];
}