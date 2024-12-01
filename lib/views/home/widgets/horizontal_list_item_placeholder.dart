import 'package:flutter/material.dart';
import 'package:news_app/views/home/widgets/lines_list.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalListItemPlaceholder extends StatelessWidget {
  const HorizontalListItemPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(31, 230, 210, 210),
      highlightColor: Colors.black87,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
        height: mediaQuery.height * 240 / 812,
        width: mediaQuery.width * 321 / 375,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),

          // color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: LinesList(itemCount: 2)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 10 / 812,
            ),
            const Expanded(child: LinesList(itemCount: 3)),
            const Spacer(),
            const Expanded(
              child: LinesList(
                itemCount: 1,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
