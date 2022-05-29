import 'package:json_annotation/json_annotation.dart';

part 'free_game.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FreeGame {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;

  bool get isPcGame => platform == 'PC (Windows)';

  FreeGame({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
  });

  factory FreeGame.fromJson(Map<String, dynamic> json) => _$FreeGameFromJson(json);

  Map<String, dynamic> toJson() => _$FreeGameToJson(this);
}