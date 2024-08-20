import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/cubits/category_cubit/category_cubit.dart';
import 'package:news_app/models/custom_container1.dart';
import 'package:news_app/screens/web_view.dart';

class CustomContainer2 extends StatelessWidget {
  const CustomContainer2({super.key, required this.container1Model});
  final Container1Model container1Model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoryCubit.getCubit(context);
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => WebViewScreen(link: container1Model.link),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 8),
            height: MediaQuery.of(context).size.height * 128 / 812,
            width: MediaQuery.of(context).size.width * 345 / 375,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  container1Model.imageUrl ??
                      "https://images.unsplash.com/photo-1523878288860-7ad281611901?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        container1Model.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 12 / 375,
                    ),
                    IconButton(
                      onPressed: () {
                        //   cubit.changeFavorite(container1Model.articleId);
                      },
                      icon: Icon(Icons.favorite,
                          color: Colors
                              .white //Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 200 / 375,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        container1Model.description ?? "",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      container1Model.pubDate.substring(0, 11),
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
          ),
        );
      },
    );
  }
}
