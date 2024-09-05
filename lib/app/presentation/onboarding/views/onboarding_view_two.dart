
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/presentation/onboarding/widgets/onboarding_text_columns.dart';
import 'package:math_solver/app/presentation/onboarding/widgets/purple_background.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const PurpleBackground(),
          Positioned(
            top: 0,
            child: SizedBox(
              height: DeviceSize.height! * 0.79,
              width: DeviceSize.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: DeviceSize.height! * 0.10,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: DeviceSize.width,
                        height: DeviceSize.height! * 0.45,
                        child: Image.asset(
                          AssetsPath.precacheList[2],
                          height: DeviceSize.width! * 0.7,
                          width: DeviceSize.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const OnBoardingTextColumn(
                      title: TextConstants.solveText,
                      subtitle1: TextConstants.ourAlgoritmSolveText,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
