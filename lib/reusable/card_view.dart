import 'package:flutter/material.dart';

import 'package:free_games/reusable/free_label.dart';

class CardView extends StatelessWidget {
  final String title;
  final String thumbnailUrl;

  const CardView({
    super.key,
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.jpg',
                image: thumbnailUrl,
                width: 300.0,
                height: 175.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF32383E),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF25282D),
                  blurRadius: 5.0,
                  offset: Offset(0, 4),
                )
              ],
            ),
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: const TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0,),
                  const FreeLabel(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}