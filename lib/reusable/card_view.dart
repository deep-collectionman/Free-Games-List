import 'package:flutter/material.dart';

import 'package:free_games/reusable/free_label.dart';
import 'package:free_games/styles/default_text_style.dart';

class CardView extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final Widget detailWidget;
  final IconData iconData;

  const CardView({
    super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.detailWidget,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => detailWidget),
      ),
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.jpg',
                image: thumbnailUrl,
                width: 300.0,
                height: 175.0,
                fit: BoxFit.cover,
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
                        style: defaultTextStyle(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0,),
                    Row(
                      children: [
                        Icon(
                          iconData,
                          color: const Color(0xFF7A8288),
                        ),
                        const SizedBox(width: 8.0,),
                        const FreeLabel(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
