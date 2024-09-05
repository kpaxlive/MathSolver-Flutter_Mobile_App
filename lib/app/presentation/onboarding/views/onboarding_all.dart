
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/presentation/onboarding/views/onboarding_view_one.dart';
import 'package:math_solver/app/presentation/onboarding/views/onboarding_view_three.dart';
import 'package:math_solver/app/presentation/onboarding/views/onboarding_view_two.dart';
import 'package:math_solver/app/presentation/onboarding/widgets/onboarding_continue_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingAll extends StatelessWidget with ServicesMixin{
   OnBoardingAll({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: const [
            OnBoardingOne(),
            OnBoardingTwo(),
            OnBoardingThree(),
          ],
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
                    height: DeviceSize.height! * 0.01,
                  ),
                  SmoothPageIndicator(
                    effect: const WormEffect(
                      dotHeight: 9,
                      dotWidth: 9,
                    ),
                    controller: _controller,
                    count: 3,
                  ),
                  SizedBox(
                    height: DeviceSize.height! * 0.02,
                  ),
                  OnboardingContinueButton(controller: _controller, hiveService: hiveService, navigationService: navigationService)
                ],
              )),
        )
      ]),
    );
  }
}


