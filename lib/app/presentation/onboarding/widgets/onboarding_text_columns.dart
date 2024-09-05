
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/widgets/onboarding_text.dart';

class OnBoardingTextColumn extends StatelessWidget {
  const OnBoardingTextColumn({
    super.key,
    required this.title,
    required this.subtitle1,
  });

  final String title;
  final String subtitle1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          AppGeneralText(
              text: title, fontWeight: FontWeight.w700, fontSize: 35),
          AppGeneralText(
              text: subtitle1, fontWeight: FontWeight.w400, fontSize: 18),
        ],
      ),
    );
  }
}
