
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class PayWallChoices extends StatelessWidget {
  const PayWallChoices({super.key, required this.insideText,required this.checked});

  final String insideText;
  final bool checked;

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      height: DeviceSize.height! * 0.09,
      width: DeviceSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorPalette.paywallColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            insideText,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
          ),
    
          checked 
          ? Image.asset(
            AssetsPath.precacheList[8],
            height: DeviceSize.height! * 0.03,
            color: ColorPalette.buttonColor,
          )
          : Icon(
            Icons.circle_outlined,
            color: Colors.grey.shade400,
            size: DeviceSize.height! * 0.035,
          ),
        ],
      ),
    );
  }
}
