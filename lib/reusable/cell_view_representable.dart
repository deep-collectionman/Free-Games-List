import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:free_games/models/free_game.dart';

abstract class CellViewRepresentable {
  String get thumbnailUrl;
  String get title;
  String get subDetail;
  IconData get iconData;
}

class CellViewGameModel implements CellViewRepresentable {
  final FreeGame game;

  const CellViewGameModel({required this.game});

  @override
  String get title => game.title;

  @override
  String get thumbnailUrl => game.thumbnail;

  @override
  String get subDetail => game.genre;

  @override
  IconData get iconData => game.isPcGame
      ? FontAwesomeIcons.windows
      : FontAwesomeIcons.firefoxBrowser;
}