import 'package:flutter/material.dart';

import 'package:free_games/reusable/section_header.dart';
import 'package:free_games/models/genres.dart';

class GenresSection extends StatefulWidget {
  const GenresSection({Key? key}) : super(key: key);

  @override
  State<GenresSection> createState() => _GenresSectionState();
}

class _GenresSectionState extends State<GenresSection> {
  String? currentSelectedGenre;

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
                          color: currentSelectedGenre == genre ? Colors.white : const Color(0xFFAAAAAA),
                        ),
                      ),
                      child: ChoiceChip(
                        label: Text(genre?.toUpperCase() ?? ''),
                        selected: currentSelectedGenre == genre,
                        onSelected: (bool value) {
                          setState(() {
                            currentSelectedGenre = genre;
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
