
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/core/widgets/onboarding_text.dart';
import 'package:math_solver/app/data/services/navigation_service.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.navigationService,
  });

  final NavigationService navigationService;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const AppGeneralText(
          text: "Math Solver", fontWeight: FontWeight.bold, fontSize: 35),
      actions: [
        InkWell(
            onTap: () => navigationService.pushNamed('/settingsView'),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Image.asset(
              AssetsPath.precacheList[12],
              height: 60,
              width: 60,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceSize.height! * 0.08);
}
