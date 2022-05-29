import 'package:flutter/material.dart';

import 'package:free_games/views/game_list_section.dart';
import 'package:free_games/views/genres_section.dart';
import 'package:free_games/views/most_recent_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 24.0,),
              GenresSection(),
              SizedBox(height: 24.0,),
              MostRecentSection(),
              GameListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
