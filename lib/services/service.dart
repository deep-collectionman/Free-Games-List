import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:free_games/models/free_game.dart';

enum SortRule {
  alphabeticalOrder,
  releaseDate
}

abstract class Service {
  Future<List<FreeGame>> get mostRecentGames;

  Future<List<FreeGame>> getGames();
  Future<List<FreeGame>> getGamesByCategory(String category);
  Future<List<FreeGame>> getGamesForPlatform(String platform);
  Future<List<FreeGame>> getGamesSortedByRule(SortRule sortRule);
}

class FreeGamesService implements Service {
  @override
  Future<List<FreeGame>> get mostRecentGames async {
    final sortedGames = await getGamesSortedByRule(SortRule.releaseDate);
    List<FreeGame> mostRecentGames = [];
    for (var index = 0; index <= 2; index++) {
      mostRecentGames.add(sortedGames[index]);
    }

    return mostRecentGames;
  }

  @override
  Future<List<FreeGame>> getGames() async {
    return _getGames(null);
  }

  @override
  Future<List<FreeGame>> getGamesByCategory(String category) async {
    return _getGames({'category' : category});
  }

  @override
  Future<List<FreeGame>> getGamesForPlatform(String platform) async {
    return _getGames({'platform' : platform});
  }

  @override
  Future<List<FreeGame>> getGamesSortedByRule(SortRule sortRule) async {
    switch (sortRule) {
      case SortRule.alphabeticalOrder:
        return _getGames({'sort-by': 'alphabetical'});
      case SortRule.releaseDate:
        return _getGames({'sort-by': 'release-date'});
    }
  }

  Future<List<FreeGame>> _getGames(Map<String, String>? queries) async {
    final response = await http.get(
      Uri(
        scheme: 'https',
        host: 'www.freetogame.com',
        path: '/api/games',
        queryParameters: queries,
      ),
    );
    switch (response.statusCode) {
      case 200:
        final json = jsonDecode(response.body);
        return List.from(json).map((element) => FreeGame.fromJson(element)).toList();
      case 404:
        throw const HttpException('Object not found: Game or endpoint not found');
      case 500:
        throw const HttpException('Something went wrong on our end (unexpected server errors) ');
      default:
        throw 'Unexpected Error';
    }
  }
}