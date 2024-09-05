
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/core/widgets/continue_button.dart';
import 'package:math_solver/app/core/widgets/onboarding_text.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';


class WelcomeView extends StatelessWidget with ServicesMixin {
  WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
                height: DeviceSize.height! * 0.70,
                width: DeviceSize.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(
                      AssetsPath.precacheList[13],
                    ),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Positioned(
            bottom: DeviceSize.height! * 0.23,
            child: Center(
              child: SizedBox(
                width: DeviceSize.width,
                child: const Column(
                  children: [
                    AppGeneralText(
                        text: TextConstants.welcomeText,
                        fontWeight: FontWeight.w700,
                        fontSize: 35),
                  ],
                ),
              ),
            ),
          ),
          //
          Positioned(
            bottom: 0,
            child: SizedBox(
                height: DeviceSize.height! * 0.21,
                width: DeviceSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: DeviceSize.height! * 0.047,
                    ),
                    //
                    ContinueButton(
                      buttonWidth: DeviceSize.width!,
                      onTap: () {
                        navigationService
                            .pushReplacementNamed('/onboardingView');
                      },
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
