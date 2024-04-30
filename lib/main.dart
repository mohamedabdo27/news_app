import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/SharedPreferences/shared_preverences.dart';
import 'package:news_app/bloc_observer/bloc_observer.dart';
import 'package:news_app/cubits/Container1Cubit/container1_cubit.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/cubits/category_cubit/category_cubit.dart';
import 'package:news_app/screens/home_screen.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await CachedData.init();
  bool? isDark = CachedData.getData("isDark");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (fn) => runApp(
      NewsApp(
        isDark: isDark,
      ),
    ),
  );
}

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 71, 247, 174),
    brightness: Brightness.light,
  ),
);
ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 49, 73, 43),
    brightness: Brightness.dark,
  ),
);

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.isDark});
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit()
            ..getNews(catName: "health")
            ..changeMode(isDarkMode: isDark),
        ),
        BlocProvider(
          create: (context) => Container1Cubit()..getTopNews(),
        ),
      ],
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: CategoryCubit.getCubit(context).isDark ? darkTheme : theme,
            home: const HomeScreen(),
          );
        },
      ),
    );

    //  BlocProvider(
    //   create: (context) => CategoryCubit()
    //     ..getNews(catName: "health")
    //     ..getTopNews(),
    //   child: BlocConsumer<CategoryCubit, CategoryState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       return MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         theme: CategoryCubit.getCubit(context).isDark ? darkTheme : theme,
    //         home: const HomeScreen(),
    //       );
    //     },
    //   ),
    // );
  }
}
