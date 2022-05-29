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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0,),
      child: Column(
        children: [
          SectionHeaderView(
            title: title,
          ),
          blocBuilder,
        ],
      ),
    );
  }
}