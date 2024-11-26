// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:news_app/models/news_model.dart';

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key, required this.containerModel});
//   final NewsModel containerModel;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           //PreferredSize(
//           //   preferredSize: Size.fromHeight(12),
//           //   child: AppBar(
//           //     automaticallyImplyLeading: false,
//           //     backgroundColor: const Color.fromARGB(255, 90, 87, 86),
//           //   ),
//           ),
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: Image.network(
//               fit: BoxFit.cover,
//               height: MediaQuery.of(context).size.height * 400 / 812,
//               containerModel.imageUrl ??
//                   "https://images.unsplash.com/photo-1523878288860-7ad281611901?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               height: MediaQuery.of(context).size.height * 430 / 812,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 88, right: 16, left: 16),
//                 child: Text(
//                   textAlign: TextAlign.center,
//                   maxLines: 16,
//                   overflow: TextOverflow.ellipsis,
//                   containerModel.description ?? "no content found",
//                   style: GoogleFonts.nunito(
//                     fontSize: 14,
//                     color: const Color(0xff2E0505),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 311 / 375,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 219, 219, 216),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(16),
//                 ),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       containerModel.pubDate.substring(0, 11),
//                       style: GoogleFonts.nunito(
//                         fontSize: 12,
//                         color: const Color(0xff2E0505),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 10 / 812,
//                     ),
//                     Text(
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       containerModel.title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Color(0xff2E0505),
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(0.8, .9),
//             child: CircleAvatar(
//               backgroundColor: const Color(0xffFF8086),
//               radius: 25,
//               child: SvgPicture.asset("assets/images/Vector.svg"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
