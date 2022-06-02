import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:free_games/models/free_game.dart';
import 'package:free_games/screens/detail/detail_screen_representable.dart';
import 'package:free_games/screens/detail/detail_screen.dart';

abstract class CardViewRepresentable {
  String get title;
  String get thumbnailUrl;
  Widget get detailScreenModel;
  IconData get iconData;
}

class CardViewGameModel implements CardViewRepresentable {
  final FreeGame game;

  const CardViewGameModel({required this.game});

  @override
  String get title => game.title;

  @override
  String get thumbnailUrl => game.thumbnail;

  @override
  Widget get detailScreenModel => DetailScreen(model: DetailScreenGameModel(game: game));

  @override
  IconData get iconData => game.isPcGame
      ? FontAwesomeIcons.windows
      : FontAwesomeIcons.firefoxBrowser;
}