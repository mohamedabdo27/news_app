import 'package:flutter/material.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/views/search/search_view.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.left,
      cursorHeight: 25,
      maxLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: "Dogecoin to the Moon...",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                widget.cubit.getSearchNews(
                  searchKey: controller.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SearchView(
                      name: controller.text,
                    ),
                  ),
                );
                controller.clear();
              }
            },
            icon: const Icon(Icons.search)),
      ),
      onSubmitted: (name) {
        if (name.isNotEmpty) {
          widget.cubit.getSearchNews(searchKey: name);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => SearchView(
                name: name,
              ),
            ),
          );
          controller.clear();
        }
      },
    );
  }
}
