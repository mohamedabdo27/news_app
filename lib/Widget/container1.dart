import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/custom_container1.dart';
import 'package:news_app/screens/web_view.dart';

class CustomContainer1 extends StatelessWidget {
  const CustomContainer1({
    super.key,
    required this.container1model,
  });
  final Container1Model container1model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => WebViewScreen(link: container1model.link),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
        height: MediaQuery.of(context).size.height * 240 / 812,
        width: MediaQuery.of(context).size.width * 321 / 375,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              container1model.image ??
                  "https://images.unsplash.com/photo-1523878288860-7ad281611901?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              container1model.text1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Color(0xffFFFFFF)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 10 / 812,
            ),
            Text(
              container1model.text2 ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xffFFFFFF),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  container1model.text3.substring(0, 11),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    color: Theme.of(context).colorScheme.background,
                    //Theme.of(context).colorScheme.primary,
                    Icons.favorite,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
