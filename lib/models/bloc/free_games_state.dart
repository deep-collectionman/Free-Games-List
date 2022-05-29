part of 'free_games_bloc.dart';

abstract class FreeGamesState extends Equatable {
  const FreeGamesState();

  @override
  List<Object> get props => [];
}

class FreeGamesInitialState extends FreeGamesState {}

class FreeGamesLoadedState extends FreeGamesState {
  final List<FreeGame> freeGames;

  const FreeGamesLoadedState({required this.freeGames});

  @override
  List<Object> get props => [freeGames];
}