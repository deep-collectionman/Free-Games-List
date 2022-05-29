import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:free_games/models/genres.dart';

import 'package:free_games/screens/home_screen.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MostRecentBloc()..add(const FreeGamesFetchMostRecentEvent())),
        BlocProvider(create: (context) => FreeGamesBloc()..add(const FreeGamesFetchByCategoryEvent(genre: Genre.moba))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Free Games',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF2A2E33),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}