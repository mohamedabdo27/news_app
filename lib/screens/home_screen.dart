import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/cubits/category_cubit/category_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoryCubit cubit = CategoryCubit.getCubit(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              elevation: 30,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Favorite",
                  icon: Icon(
                    Icons.favorite,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(
                    Icons.person,
                  ),
                )
              ]),
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
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                ),
              )
            ],
            title: Center(
              child: Text(
                cubit.appBarTitle[cubit.currentIndex],
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
