
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/constants/themes.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/presentation/home/widgets/rotating_image.dart';

class InfoAlert extends StatelessWidget {
  const InfoAlert({super.key, required this.insideText});

  final String insideText;

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            height: DeviceSize.height! * 0.13,
            width: DeviceSize.width! * 0.9,
            child: Center(
                child: Text(insideText,
                    style: getCustomTextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600))),
          ),
          insideText == TextConstants.solvingText
              ? Positioned(
                  top: -DeviceSize.height! * 0.1, child: const RotatingImage())
              : Positioned(
                  top: -DeviceSize.height! * 0.1,
                  child: Image.asset(
                    AssetsPath.precacheList[10],
                    height: DeviceSize.height! * 0.12,
                  ),
                )
        ]);
  }
}

