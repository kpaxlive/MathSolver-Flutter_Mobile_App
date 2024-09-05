
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/extensions/padding_extension.dart';
import 'package:math_solver/app/core/widgets/onboarding_text.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/presentation/home/widgets/actionsheet.dart';
import 'package:math_solver/app/presentation/home/widgets/appbar_widget.dart';
import 'package:math_solver/app/presentation/home/widgets/circle_button.dart';
import 'package:sizer/sizer.dart';


class HomeView extends StatelessWidget with ServicesMixin {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        navigationService: navigationService,
      ),
      //
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          //
          const AppGeneralText(
              text: TextConstants.startOnboardingText,
              fontWeight: FontWeight.w700,
              fontSize: 35),
          //
          const AppGeneralText(
              text: TextConstants.explainOnboardingText,
              fontWeight: FontWeight.w400,
              fontSize: 17),
          //
          Image.asset(
            AssetsPath.precacheList[0],
            height: 17.h,
          ).onlyPadding(top: 3.h),
          //
          CircleButton(onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => ActionSheet(),
            );
          }).symmetricPadding(vertical: 3.h),
        ],
      ),
    );
  }
}
