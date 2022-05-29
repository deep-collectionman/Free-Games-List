part of 'free_games_bloc.dart';

abstract class FreeGamesEvent extends Equatable {
  const FreeGamesEvent();

  @override
  List<Object> get props => [];
}

class FreeGamesFetchEvent extends FreeGamesEvent {
  const FreeGamesFetchEvent();
}

class FreeGamesFetchAllEvent extends FreeGamesFetchEvent {
  const FreeGamesFetchAllEvent();
}

class FreeGamesFetchMostRecentEvent extends FreeGamesFetchEvent {
  const FreeGamesFetchMostRecentEvent();
}

class FreeGamesFetchByCategoryEvent extends FreeGamesFetchEvent {
  final Genre genre;

  const FreeGamesFetchByCategoryEvent({required this.genre});

  @override
  List<Object> get props => [genre];
}

class FreeGamesFetchForPlatformEvent extends FreeGamesFetchEvent {
  final String platform;

  const FreeGamesFetchForPlatformEvent({required this.platform});

  @override
  List<Object> get props => [platform];
}

class FreeGamesFetchUsingSortRuleEvent extends FreeGamesFetchEvent {
  final SortRule sortRule;

  const FreeGamesFetchUsingSortRuleEvent({required this.sortRule});

  @override
  List<Object> get props => [sortRule];
}