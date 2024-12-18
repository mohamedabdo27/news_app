import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/app_cubit/app_states.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/cubits/category_news_cubit/category_news_cubit.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.getCubit(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              const Duration(seconds: 2),
              () {
                BlocProvider.of<HorizontalListViewCubit>(context).getTopNews();
                BlocProvider.of<CategoryNewsCubit>(context)
                    .getCategoryNews(catName: "health");
              },
            );
          },
          child: Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 10 / 375,
                  ),
                  child: IconButton(
                    onPressed: () {
                      cubit.changeMode();
                    },
                    icon: const Icon(
                      Icons.brightness_4_outlined,
                    ),
                  ),
                ),
              ],
              title: Center(
                child: Text(
                  cubit.appBarTitle[cubit.currentIndex],
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              elevation: 30,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              items: cubit.bottomNavBarItems,
            ),
          ),
        );
      },
    );
  }
}
