import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:free_games/reusable/card_view.dart';
import 'package:free_games/reusable/section_header.dart';

class MostRecentSection extends StatelessWidget {
  const MostRecentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeaderView(
          title: 'Most Recent Games',
        ),
        BlocBuilder<MostRecentBloc, FreeGamesState>(builder: (context, state) {
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

          return const CircularProgressIndicator(
            color: Colors.white,
          );
        }),
      ],
    );
  }
}

class BlocBuildableSection extends StatelessWidget {
  final String title;
  final BlocBuilder blocBuilder;

  const BlocBuildableSection({
    super.key,
    required this.title,
    required this.blocBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
