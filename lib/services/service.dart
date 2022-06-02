import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:free_games/models/free_game.dart';
import 'package:free_games/models/genres.dart';

enum SortRule {
  alphabeticalOrder,
  releaseDate
}

abstract class Service {
  Future<List<FreeGame>> getGames();
  Future<List<FreeGame>> mostRecentGames(Genre genre);
  Future<List<FreeGame>> getGamesByGenre(Genre genre);
  Future<List<FreeGame>> getGamesForPlatform(String platform);
  Future<List<FreeGame>> getGamesSortedByRule(SortRule sortRule);
}

class FreeGamesService implements Service {
  final _maxNumberPerPage = 10;
  int _indexOfLastItem = 0;
  Uri? _lastRequest;

  FreeGamesService();

  @override
  Future<List<FreeGame>> mostRecentGames(Genre genre) async {
    final sortedGames = await _getGames({
      if (genre != Genre.all) 'category' : genres[genre]!,
      'sort-by': 'release-date',
    });
    List<FreeGame> mostRecentGames = [];
    for (var index = 0; index <= 4; index++) {
      mostRecentGames.add(sortedGames[index]);
    }

    return mostRecentGames;
  }

  @override
  Future<List<FreeGame>> getGames() async {
    return _getGames(null);
  }

  @override
  Future<List<FreeGame>> getGamesByGenre(Genre genre) async {
    return _getGames({if (genre != Genre.all) 'category' : genres[genre]!});
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

    final currentRequest = response.request?.url;
    switch (response.statusCode) {
      case 200:
        final json = jsonDecode(response.body);
        var result = List.from(json).map((element) =>
            FreeGame.fromJson(element)).toList();
        final numberOfPages = (result.length / _maxNumberPerPage).truncate();

        if (_lastRequest == null) {
          result = numberOfPages > 1 ? result.sublist(0, _maxNumberPerPage) : result;
        } else if (numberOfPages > 1 && _lastRequest == currentRequest) {
          result = result.sublist(_indexOfLastItem, _maxNumberPerPage + _indexOfLastItem);
          _indexOfLastItem = result.indexOf(result.last);
        } else {
          _indexOfLastItem = 0;
          result = numberOfPages > 1 ? result.sublist(0, _maxNumberPerPage) : result;
        }

        _lastRequest = currentRequest;

        return result;
      case 404:
        throw const HttpException('Object not found: Game or endpoint not found');
      case 500:
        throw const HttpException('Something went wrong on our end (unexpected server errors) ');
      default:
        throw 'Unexpected Error';
    }
  }
}