import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widget/container1.dart';
import 'package:news_app/cubits/Container1Cubit/container1_cubit.dart';
import 'package:news_app/cubits/Container1Cubit/container1_state.dart';

class Container1List extends StatelessWidget {
  const Container1List({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Container1Cubit, Container1State>(
      listener: (context, state) {},
      builder: (context, state) {
        Container1Cubit cubit = Container1Cubit.getCubit(context);

        if (state is GetTopNewsFalureState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 240 / 812,
            child: const Center(
              child: Text("There was error ,try again later"),
            ),
          );
        }
        return cubit.topNewsList.isNotEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 240 / 812,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.topNewsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => CustomContainer1(
                    container1model: cubit.topNewsList[index],
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 240 / 812,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
// class Container1List extends StatefulWidget {
//   const Container1List({super.key});

//   @override
//   State<Container1List> createState() => _Container1ListState();
// }

// class _Container1ListState extends State<Container1List> {
//   var future;
//   @override
//   void initState() {
//     future = NewsServices(Dio()).getCategoryNews("top");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Container1Model>>(
//       future: future,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 240 / 812,
//             child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               itemCount: snapshot.data!.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (ctx, index) => CustomContainer1(
//                 container1model: snapshot.data![index],
//               ),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return const Center(child: Text("error, try again later"));
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );

//     //SizedBox(
//     //   height: MediaQuery.of(context).size.height * 240 / 812,
//     //   child: ListView.builder(
//     //     itemCount: container1List.length,
//     //     scrollDirection: Axis.horizontal,
//     //     itemBuilder: (ctx, index) => CustomContainer1(
//     //       container1model: container1List[index],
//     //     ),
//     //   ),
//     // );
//   }
// }
