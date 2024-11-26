import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/views/home/widgets/horizontal_list_item.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_cubit.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_state.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalListViewCubit, HorizontalListViewState>(
      builder: (context, state) {
        HorizontalListViewCubit cubit =
            HorizontalListViewCubit.getCubit(context);

        if (state is GetTopNewsFalureState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 240 / 812,
            child: Center(
              child: Text(state.error),
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
                    newsModel: cubit.topNewsList[index],
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
