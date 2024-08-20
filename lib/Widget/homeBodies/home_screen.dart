import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widget/category_list.dart';
import 'package:news_app/Widget/container1_list.dart';
import 'package:news_app/Widget/container2_list.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/cubits/category_cubit/category_cubit.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/services/news_service.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoryCubit cubit = CategoryCubit.getCubit(context);

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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 32 / 812,
                    width: MediaQuery.of(context).size.width * 296 / 375,
                    child: TextField(
                      textAlign: TextAlign.left,
                      cursorHeight: 25,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              // color: Color(0xffF0F1FA),
                              ),
                        ),
                        hintText: "Dogecoin to the Moon...",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                        suffixIcon: const Icon(Icons.search),
                      ),
                      onSubmitted: (name) {
                        cubit.getSearchNews(searchKey: name);
                        log(name);
                        // NewsServices(Dio()).getSearchNews(name).then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => SearchScreen(
                              name: name,
                            ),
                          ),
                        );
                        //}
                        //)
                      },
                    ),
                  ),
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
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
                                color: Theme.of(context).colorScheme.primary),
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
              const Container1List(),
              SizedBox(height: MediaQuery.of(context).size.height * 24 / 812),
              //=-------------------------------------------------------------
              const CategoryList(),
              //----------------------------------------------------------------
              SizedBox(height: MediaQuery.of(context).size.height * 16 / 812),
              //=------------------------------------------------------------------
              const Container2List(),
            ],
          ),
        );
      },
    );
  }
}
