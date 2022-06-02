import 'package:free_games/models/free_game.dart';

abstract class DetailScreenRepresentable {
  String get title;
  String get thumbnailUrl;
  String get shortDescription;
  String get gameUrl;
  String get genre;
  String get platform;
  String get publisher;
  String get developer;
  String get releaseDate;
}

class DetailScreenGameModel implements DetailScreenRepresentable {
  final FreeGame game;

  const DetailScreenGameModel({required this.game});

  @override
  String get title => game.title;

  @override
  String get thumbnailUrl => game.thumbnail;

  @override
  String get shortDescription => game.shortDescription;

  @override
  String get gameUrl => game.gameUrl;

  @override
  String get genre => game.genre;

  @override
  String get platform => game.platform;

  @override
  String get publisher => game.publisher;

  @override
  String get developer => game.developer;

  @override
  String get releaseDate => game.releaseDate;
}