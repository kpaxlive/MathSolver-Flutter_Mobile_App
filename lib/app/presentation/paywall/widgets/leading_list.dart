
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class LeadingList extends StatelessWidget {
  const LeadingList({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: DeviceSize.height! * 0.13,
      width: DeviceSize.width! * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AssetsPath.precacheList[8],
                height: 10,
                width: 10,
              ),
              Text(
                "Lorem Ipsum Dolor Sit",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ],
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AssetsPath.precacheList[8],
                height: 10,
                width: 10,
              ),
              Text(
                "Lorem Ipsum Dolor Sit",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ],
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AssetsPath.precacheList[8],
                height: 10,
                width: 10,
              ),
              Text(
                "Lorem Ipsum Dolor Sit",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
