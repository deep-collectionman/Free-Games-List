// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeGame _$FreeGameFromJson(Map<String, dynamic> json) => FreeGame(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      shortDescription: json['short_description'] as String,
      gameUrl: json['game_url'] as String,
      genre: json['genre'] as String,
      platform: json['platform'] as String,
      publisher: json['publisher'] as String,
      developer: json['developer'] as String,
      releaseDate: json['release_date'] as String,
    );

Map<String, dynamic> _$FreeGameToJson(FreeGame instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'short_description': instance.shortDescription,
      'game_url': instance.gameUrl,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'release_date': instance.releaseDate,
    };
