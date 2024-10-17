import 'package:flutter/material.dart';
import 'package:news_app/Widget/list_view_item.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({
    super.key,
    required this.name,
    required this.cubit,
  });

  final String name;
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 14 / 375,
          MediaQuery.of(context).size.height * 10 / 812,
          MediaQuery.of(context).size.width * 14 / 375,
          0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Result for ",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 92, 84, 84),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 5 / 812,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.searchList.length,
              itemBuilder: (context, index) {
                return ListViewItem(
                  container1Model: cubit.searchList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
