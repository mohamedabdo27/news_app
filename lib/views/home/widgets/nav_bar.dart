import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(32)),
      width: MediaQuery.of(context).size.width * 289 / 375,
      height: MediaQuery.of(context).size.height * 66 / 812,
      padding: const EdgeInsets.fromLTRB(40, 16, 40, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset("assets/images/home.svg"),
              const Spacer(),
              Text(
                "Home",
                style: GoogleFonts.nunito(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff2E0505),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset("assets/images/favorite.svg"),
              const Spacer(),
              Text(
                "Favorite",
                style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff2E0505)),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset("assets/images/profile.svg"),
              const Spacer(),
              Text(
                "Profile",
                style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff2E0505)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
