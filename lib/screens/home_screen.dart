import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:free_games/reusable/cell_view.dart';
import 'package:free_games/views/genres_section.dart';
import 'package:free_games/reusable/card_view.dart';
import 'package:free_games/reusable/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Games'),
        centerTitle: true,
        backgroundColor: const Color(0xFF272B30),
      ),
      body: Center(
        child: BlocBuilder<FreeGamesBloc, FreeGamesState>(builder: (context, state) {
          if (state is FreeGamesInitialState) {
            return const CircularProgressIndicator(color: Colors.white);
          }

          if (state is FreeGamesLoadedState) {
            return Container(
              height: double.infinity,
              child: ListView(
                children: [
                  const SizedBox(height: 24.0,),
                  const SectionHeaderView(title: 'Genres',),
                  const SizedBox(height: 12.0,),
                  const GenresSection(),
                  const SizedBox(height: 24.0,),
                  const SectionHeaderView(title: 'Most Recent Games',),
                  SizedBox(
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
                  ),
                  const SectionHeaderView(title: 'All Games',),
                  Column(
                    children: [
                      for (final game in state.freeGames)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CellView(
                            thumbnailUrl: game.thumbnail,
                            title: game.title,
                            subDetail: game.genre,
                            iconData: game.isPcGame ? FontAwesomeIcons.windows : FontAwesomeIcons.firefoxBrowser,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            );
          }

          return const Center(
            child: Text('Something went wrong!'),
          );
        }),
      ),
    );
  }
}
