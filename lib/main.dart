import 'package:flutter/material.dart';
import 'package:free_games/services/service.dart';

void main() async {
  runApp(const App());
  final service = FreeGamesService();
  final mobaGames = await service.getGamesByCategory('MOBA');
  final pcGames = await service.getGamesForPlatform('pc');
  final gamesSortedByAlpha = await service.getGamesSortedByRule(SortRule.alphabetical);
  final gamesSortedByReleaseDate = await service.getGamesSortedByRule(SortRule.releaseDate);
  print(mobaGames.length);
  print(pcGames.length);
  print(gamesSortedByAlpha.length);
  print(gamesSortedByReleaseDate.length);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}