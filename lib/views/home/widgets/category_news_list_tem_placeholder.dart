import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/views/home/widgets/lines_list.dart';
import 'package:shimmer/shimmer.dart';

class CategoryNewsListItemPlaceholder extends StatelessWidget {
  const CategoryNewsListItemPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: BlocProvider.of<AppCubit>(context).isDark
          ? const Color.fromARGB(31, 230, 210, 210)
          : Colors.grey[300]!,
      highlightColor: BlocProvider.of<AppCubit>(context).isDark
          ? Colors.black87
          : Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8),
        height: MediaQuery.of(context).size.height * 128 / 812,
        width: MediaQuery.of(context).size.width * 345 / 375,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: LinesList(itemCount: 2)),
            Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 10,
                    width: 200,
                    child: LinesList(
                      itemCount: 1,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 10,
                    width: 100,
                    child: LinesList(
                      itemCount: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
