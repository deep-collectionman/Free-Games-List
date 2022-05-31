import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:free_games/models/bloc/free_games_bloc.dart';
import 'package:free_games/models/genres.dart';
import 'package:free_games/reusable/section_header.dart';
import 'package:free_games/styles/default_text_style.dart';

class GenresSection extends StatefulWidget {
  const GenresSection({Key? key}) : super(key: key);

  @override
  State<GenresSection> createState() => _GenresSectionState();
}

class _GenresSectionState extends State<GenresSection> {
  Genre _currentSelectedGenre = Genre.all;

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
      case Genre.all:
        return FontAwesomeIcons.gamepad;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1C1F),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF25282D),
            blurRadius: 5.0,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderView(
            title: 'Filter By Genre',
            color: Color(0xFFAAAAAA),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.keys.length,
              itemBuilder: (context, index) {
                final genre = genres.keys.toList()[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ChipTheme(
                    data: ChipTheme.of(context).copyWith(
                      backgroundColor: const Color(0xFF2A2E33),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _currentSelectedGenre != genre ? Colors.white : Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelStyle: defaultTextStyle(
                        color: _currentSelectedGenre == genre ? Colors.black : const Color(0xFFAAAAAA),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                    child: ChoiceChip(
                      label: SizedBox(
                        width: 85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(genres[genre]?.toUpperCase() ?? '',),
                            Icon(
                              _iconForGenre(genre),
                              color: _currentSelectedGenre == genre
                                  ? Colors.black
                                  : const Color(0xFFAAAAAA),
                              size: 14,
                            )
                          ],
                        ),
                      ),
                      selected: _currentSelectedGenre == genre,
                      onSelected: (bool value) {
                        setState(() {
                          _currentSelectedGenre = genre;
                          context
                              .read<FreeGamesBloc>()
                              .add(fetchByGenre(genre));
                          context
                              .read<MostRecentBloc>()
                              .add(fetchMostRecent(genre: genre));
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
