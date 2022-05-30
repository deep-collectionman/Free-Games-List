import 'package:flutter/material.dart';

import 'package:free_games/models/free_game.dart';
import 'package:free_games/screens/detail_screen_builder.dart';
import 'card_view.dart';

class CardViewBuilder {
  static Widget build(FreeGame game) {
    return CardView(
      title: game.title,
      thumbnailUrl: game.thumbnail,
      detailWidget: DetailScreenBuilder.build(game),
    );
  }
}