import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widget/container2.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/cubits/category_cubit/category_cubit.dart';

class Container2List extends StatelessWidget {
  const Container2List({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoryCubit cubit = CategoryCubit.getCubit(context);
        if (state is GetCategoryNewsFalureState) {
          return Center(child: Text(state.error!));
        }

        return cubit.container1List.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: cubit.container1List.length,
                itemBuilder: (ctx, index) => CustomContainer2(
                  container1Model: cubit.container1List[index],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
