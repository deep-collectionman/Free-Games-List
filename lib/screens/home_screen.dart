import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:free_games/views/game_list_section.dart';
import 'package:free_games/views/genres_section.dart';
import 'package:free_games/views/most_recent_section.dart';
import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:free_games/models/genres.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MostRecentBloc()..add(const FreeGamesFetchMostRecentEvent())),
        BlocProvider(create: (context) => FreeGamesBloc()..add(const FreeGamesFetchByCategoryEvent(genre: Genre.moba))),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Free Games'),
          centerTitle: true,
          backgroundColor: const Color(0xFF020202),
        ),
        body: Center(
          child: SizedBox(
            height: double.infinity,
            child: ListView(
              children: const [
                GenresSection(),
                MostRecentSection(),
                GameListSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
