import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widget/horizontal_list_item.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_state.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/container1_state.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    log("CustomHorizontalListView");

    return BlocConsumer<HorizontalListViewCubit, HorizontalListViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        HorizontalListViewCubit cubit =
            HorizontalListViewCubit.getCubit(context);

        if (state is GetTopNewsFalureState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 240 / 812,
            child: const Center(
              child: Text("There was error ,try again later"),
            ),
          );
        }
        return cubit.topNewsList.isNotEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 240 / 812,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.topNewsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => HorizontalListItem(
                    container1model: cubit.topNewsList[index],
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 240 / 812,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
