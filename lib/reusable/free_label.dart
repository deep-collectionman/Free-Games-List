import 'package:flutter/material.dart';

import 'package:free_games/styles/default_text_style.dart';

class FreeLabel extends StatelessWidget {
  const FreeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xFF4799EB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'FREE',
          style: defaultTextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}