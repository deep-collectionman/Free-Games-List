import 'package:flutter/material.dart';

import 'package:free_games/screens/home_screen.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Free Games',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white // const Color(0xFF2A2E33),
      ),
      home: const HomeScreen(),
    );
  }
}