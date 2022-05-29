import 'package:flutter/material.dart';

import 'package:free_games/reusable/free_label.dart';

class CellView extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String subDetail;
  final IconData iconData;

  const CellView({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.subDetail,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF32383E),
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF25282D),
            blurRadius: 5.0,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                  width: 150.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 210,
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
                const SizedBox(height: 8.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      iconData,
                      color: const Color(0xFF7A8288),
                    ),
                    const SizedBox(width: 12.0,),
                    const FreeLabel(),
                  ],
                ),
                const SizedBox(height: 8.0,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7A8288),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      subDetail,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
