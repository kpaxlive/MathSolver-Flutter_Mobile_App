

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/data/services/hive_service.dart';
import 'package:math_solver/app/data/services/navigation_service.dart';

class PayWallButton extends StatelessWidget {
  final bool annual;
  final bool monthly;
   PayWallButton({super.key, required this.monthly, required this.annual});

  final HiveService hiveService = GetIt.instance();
  final NavigationService navigationService = GetIt.instance();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if(monthly || annual){
          hiveService.changePremiumState(true);
          navigationService.pushReplacementNamed('/homeView');
        }
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: DeviceSize.height! * 0.072,
        width: DeviceSize.width! * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorPalette.buttonColor,
        ),
        child: Center(
          child: Text("Start",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              )),
        ),
      ),
    );
  }
}
