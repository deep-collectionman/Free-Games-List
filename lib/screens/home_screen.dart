import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:free_games/views/game_list_section.dart';
import 'package:free_games/views/genres_section.dart';
import 'package:free_games/views/most_recent_section.dart';
import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MostRecentBloc()..add(fetchMostRecent())),
        BlocProvider(create: (context) => FreeGamesBloc()..add(fetchAllEvent)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(FontAwesomeIcons.gamepad),
              const SizedBox(width: 12.0,),
              Text(
                'Free Games',
                style: GoogleFonts.robotoSlab().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF020202),
        ),
        body: Center(
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                ListView(
                  children: const [
                    SizedBox(height: 320,),
                    MostRecentSection(),
                    GameListSection(),
                  ],
                ),
                const SizedBox(
                  height: 320,
                  child: GenresSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
