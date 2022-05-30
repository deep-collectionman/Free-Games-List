import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_games/models/bloc/free_games_bloc.dart';

import 'package:free_games/reusable/section_header.dart';
import 'package:free_games/models/genres.dart';
import 'package:google_fonts/google_fonts.dart';

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
      case Genre.all:
        return FontAwesomeIcons.gamepad;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0,),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1C1F),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF25282D),
            blurRadius: 5.0,
            offset: Offset(0, 4),
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
                          side: BorderSide(
                            color: _currentSelectedGenre == genre ? Colors.black : Colors.white,
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
                              Text(
                                genre?.toUpperCase() ?? '',
                                style: GoogleFonts.roboto().copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                            context.read<FreeGamesBloc>().add(fetchByGenre(key));
                            context.read<MostRecentBloc>().add(fetchMostRecent(genre: key));
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
