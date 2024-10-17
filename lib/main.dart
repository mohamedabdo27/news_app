import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/SharedPreferences/shared_preverences.dart';
import 'package:news_app/bloc_observer/bloc_observer.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_state.dart';
import 'package:news_app/cubits/app_cubit/app_states.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/cubits/category_news_cubit/category_news_cubit.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/services/news_service.dart';

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
          create: (context) => AppCubit(newsServices: NewsServices(dio: Dio()))
            ..changeMode(isDarkMode: isDark),
        ),
        BlocProvider(
          create: (context) =>
              HorizontalListViewCubit(newsServices: NewsServices(dio: Dio()))
                ..getTopNews(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryNewsCubit(newsServices: NewsServices(dio: Dio()))
                ..getCategoryNews(catName: "health"),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppCubit.getCubit(context).isDark ? darkTheme : theme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
