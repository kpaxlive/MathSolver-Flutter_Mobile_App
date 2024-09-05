
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/core/widgets/continue_button.dart';
import 'package:math_solver/app/data/services/hive_service.dart';
import 'package:math_solver/app/data/services/navigation_service.dart';

class OnboardingContinueButton extends StatelessWidget {
  const OnboardingContinueButton({
    super.key,
    required PageController controller,
    required this.hiveService,
    required this.navigationService,
  }) : _controller = controller;

  final PageController _controller;
  final HiveService hiveService;
  final NavigationService navigationService;

  @override
  Widget build(BuildContext context) {
    return ContinueButton(
      buttonWidth: DeviceSize.width!,
      onTap: () {
        if (!((_controller.page ?? 0) >= 1.95 &&
            (_controller.page ?? 0) <= 2.05)) {
          _controller.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.ease);
        } else {
          hiveService.arrangeLaunch(false);
          bool isPremium = hiveService.getPreferences('premium') ?? false;
          navigationService.pushReplacementNamed(isPremium ? '/homeView' : '/paywallView');
        }
      },
    );
  }
}