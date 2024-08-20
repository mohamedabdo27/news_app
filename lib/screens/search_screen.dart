import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widget/container2.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/cubits/category_cubit/category_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoryCubit cubit = CategoryCubit.getCubit(context);

        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Result page",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          body: state is LoadingSearchNewsState
              ? const Center(child: CircularProgressIndicator())
              : cubit.searchList.isNotEmpty
                  ? Padding(
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
                            height:
                                MediaQuery.of(context).size.height * 5 / 812,
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: cubit.searchList.length,
                              itemBuilder: (context, index) {
                                return CustomContainer2(
                                  container1Model: cubit.searchList[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "There is no result about",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 20 / 812,
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 139, 137, 137)),
                        ),
                      ],
                    )),
        );
      },
    );
  }
}
