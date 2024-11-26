import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/functions/format_date_time.dart';
import 'package:news_app/models/news_model.dart';

class HorizontalListItemBody extends StatelessWidget {
  const HorizontalListItemBody({
    super.key,
    required this.newsModel,
    required this.imageProvider,
  });

  final NewsModel newsModel;
  final ImageProvider<Object> imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
      height: MediaQuery.of(context).size.height * 240 / 812,
      width: MediaQuery.of(context).size.width * 321 / 375,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imageProvider,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newsModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 10 / 812,
          ),
          Text(
            newsModel.description ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xffFFFFFF),
            ),
          ),
          const Spacer(),
          Text(
            formatDatTime(newsModel.pubDate),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: const Color(0xffFFFFFF),
            ),
          )
        ],
      ),
    );
  }
}
