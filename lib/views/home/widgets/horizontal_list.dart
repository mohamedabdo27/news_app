import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/views/home/widgets/horizontal_list_item.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_cubit.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_state.dart';
import 'package:news_app/views/home/widgets/horizontal_list_item_placeholder.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 240 / 812,
      child: BlocBuilder<HorizontalListViewCubit, HorizontalListViewState>(
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
          } else if (state is LoadingTopNewsState) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) =>
                  const HorizontalListItemPlaceholder(),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.topNewsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => HorizontalListItem(
                newsModel: cubit.topNewsList[index],
              ),
            );
          }
        },
      ),
    );
  }
}
