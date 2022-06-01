import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:free_games/models/free_game.dart';
import 'package:free_games/screens/detail_screen_builder.dart';
import 'card_view.dart';

class CardViewBuilder {
  static Widget build(FreeGame game) {
    return CardView(
      title: game.title,
      thumbnailUrl: game.thumbnail,
      detailWidget: DetailScreenBuilder.build(game),
      iconData: game.isPcGame
          ? FontAwesomeIcons.windows
          : FontAwesomeIcons.firefoxBrowser,
    );
  }
}