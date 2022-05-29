import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:free_games/reusable/cell_view.dart';
import 'package:free_games/views/bloc_buildable_section.dart';

class GameListSection extends StatelessWidget {
  const GameListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuildableSection(
      title: 'All Games',
      blocBuilder: BlocBuilder<FreeGamesBloc, FreeGamesState>(
        builder: (context, state) {
          if (state is FreeGamesLoadedState) {
            return Column(
              children: [
                for (final game in state.freeGames)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CellView(
                      thumbnailUrl: game.thumbnail,
                      title: game.title,
                      subDetail: game.genre,
                      iconData: game.isPcGame
                          ? FontAwesomeIcons.windows
                          : FontAwesomeIcons.firefoxBrowser,
                    ),
                  ),
              ],
            );
          }

          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0,),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
