import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_games/models/bloc/free_games_bloc.dart';

import 'package:free_games/reusable/section_header.dart';
import 'package:free_games/models/genres.dart';

class GenresSection extends StatefulWidget {
  const GenresSection({Key? key}) : super(key: key);

  @override
  State<GenresSection> createState() => _GenresSectionState();
}

class _GenresSectionState extends State<GenresSection> {
  String? _currentSelectedGenre;

  IconData _iconForGenre(Genre genre) {
    switch (genre) {
      case Genre.shooter:
        return FontAwesomeIcons.bullseye;
      case Genre.mmorpg:
        return FontAwesomeIcons.fantasyFlightGames;
      case Genre.mmo:
        return FontAwesomeIcons.dragon;
      case Genre.strategy:
        return FontAwesomeIcons.chess;
      case Genre.moba:
        return FontAwesomeIcons.mobile;
      case Genre.fighting:
        return FontAwesomeIcons.handFist;
      case Genre.social:
        return FontAwesomeIcons.solidComment;
      case Genre.sports:
        return FontAwesomeIcons.basketball;
      case Genre.cardGame:
        return FontAwesomeIcons.solidHeart;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0,),
      color: const Color(0xFF1A1C1F),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderView(title: 'Filter By Genre'),
          const SizedBox(height: 12.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: List<Widget>.generate(
                genres.length,
                (index) {
                  final key = genres.keys.toList()[index];
                  final genre = genres[key];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ChipTheme(
                      data: ChipTheme.of(context).copyWith(
                        backgroundColor: const Color(0xFF2A2E33),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelStyle: TextStyle(
                          color: _currentSelectedGenre == genre ? Colors.black : const Color(0xFFAAAAAA),
                        ),
                      ),
                      child: ChoiceChip(
                        label: SizedBox(
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(genre?.toUpperCase() ?? ''),
                              Icon(
                                _iconForGenre(key),
                                color: _currentSelectedGenre == genre ? Colors.black : const Color(0xFFAAAAAA),
                                size: 14,
                              )
                            ],
                          ),
                        ),
                        selected: _currentSelectedGenre == genre,
                        onSelected: (bool value) {
                          setState(() {
                            _currentSelectedGenre = genre;
                            // context.watch<FreeGamesBloc>().add(FreeGamesFetchByCategoryEvent(genre: key));
                            context.read<FreeGamesBloc>().add(fetchByGenre(key));
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
