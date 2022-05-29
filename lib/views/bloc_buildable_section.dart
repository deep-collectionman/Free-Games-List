import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:free_games/reusable/section_header.dart';

class BlocBuildableSection extends StatelessWidget {
  final String title;
  final BlocBuilder blocBuilder;

  const BlocBuildableSection({
    super.key,
    required this.title,
    required this.blocBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderView(
          title: title,
        ),
        blocBuilder,
      ],
    );
  }
}