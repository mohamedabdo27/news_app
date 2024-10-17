import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/Widget/category_news.dart';
import 'package:news_app/Widget/custom_horizontal_list_view.dart';
import 'package:news_app/Widget/custom_text_field.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    log("Home body");
    AppCubit cubit = AppCubit.getCubit(context);

    return Padding(
      padding: EdgeInsets.only(
        // top: MediaQuery.of(context).size.height * 30 / 812,
        left: MediaQuery.of(context).size.width * 14 / 375,
        right: MediaQuery.of(context).size.width * 14 / 375,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(cubit: cubit),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 32 / 812,
                width: MediaQuery.of(context).size.width * 33 / 375,
                child: const CircleAvatar(
                  backgroundColor: Color.fromRGBO(250, 83, 71, 1),
                  child: Icon(Icons.notification_add),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 21 / 812),
          SizedBox(
            height: MediaQuery.of(context).size.height * 50 / 812,
            child: Row(
              children: [
                Text(
                  "Latest News",
                  style: TextStyle(
                      fontSize: 18,
                      // height: 20,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 10 / 375,
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 16 / 812),
          const CustomHorizontalListView(),
          SizedBox(height: MediaQuery.of(context).size.height * 24 / 812),
          const CategoryNews()
          //=-------------------------------------------------------------
        ],
      ),
    );
  }
}
