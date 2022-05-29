import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:free_games/reusable/card_view.dart';
import 'bloc_buildable_section.dart';

class MostRecentSection extends StatelessWidget {
  const MostRecentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuildableSection(
      title: 'Most Recent Games',
      blocBuilder: BlocBuilder<MostRecentBloc, FreeGamesState>(builder: (context, state) {
        if (state is FreeGamesLoadedState) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.freeGames.length,
              itemBuilder: (context, index) {
                final game = state.freeGames[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardView(
                    title: game.title,
                    thumbnailUrl: game.thumbnail,
                  ),
                );
              },
            ),
          );
        }

        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0,),
          child: Center(
            child: CircularProgressIndicator(
              color: Color(0xFF333333),
            ),
          ),
        );
      }),
    );
  }
}
