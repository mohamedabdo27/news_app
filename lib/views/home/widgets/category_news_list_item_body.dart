import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/functions/format_date_time.dart';
import 'package:news_app/models/news_model.dart';

class CategoryNewsListItemBody extends StatelessWidget {
  const CategoryNewsListItemBody({
    super.key,
    required this.newsModel,
    required this.imageProvider,
  });

  final NewsModel newsModel;
  final ImageProvider<Object> imageProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      height: MediaQuery.of(context).size.height * 128 / 812,
      width: MediaQuery.of(context).size.width * 345 / 375,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              newsModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 200 / 375,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  newsModel.description ?? "",
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                formatDatTime(newsModel.pubDate),
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffFFFFFF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
