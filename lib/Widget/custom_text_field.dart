import 'package:flutter/material.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/screens/search_screen.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          suffixIcon: const Icon(Icons.search),
        ),
        onSubmitted: (name) {
          cubit.getSearchNews(searchKey: name);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => SearchScreen(
                name: name,
              ),
            ),
          );
        },
      ),
    );
  }
}
