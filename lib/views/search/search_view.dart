import 'package:flutter/material.dart';

import 'package:news_app/views/search/widgets/result_search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Result page",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      body: ResultBody(name: name),
    );
  }
}
