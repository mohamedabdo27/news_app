import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/views/home/widgets/category_news_list_item_body.dart';
import 'package:news_app/views/web_view/web_view.dart';

class CategoryNewsListItem extends StatelessWidget {
  const CategoryNewsListItem({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => WebViewScreen(link: newsModel.link),
            ),
          );
        },
        child: CachedNetworkImage(
          imageUrl: newsModel.imageUrl ?? "",
          errorWidget: (context, url, error) {
            return CategoryNewsListItemBody(
              newsModel: newsModel,
              imageProvider: const CachedNetworkImageProvider(
                "https://images.unsplash.com/photo-1523878288860-7ad281611901?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            );
          },
          imageBuilder: (context, imageProvider) {
            return CategoryNewsListItemBody(
              newsModel: newsModel,
              imageProvider: imageProvider,
            );
          },
        ));
  }
}
