import 'package:flutter/material.dart';

import 'package:free_games/styles/default_text_style.dart';

class SectionHeaderView extends StatelessWidget {
  final String title;
  final Color color;

  const SectionHeaderView({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: defaultTextStyle(
              color: color,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}