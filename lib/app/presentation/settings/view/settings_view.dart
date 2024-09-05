
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/core/widgets/general_appbar.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/presentation/settings/mixin/utilities_mixin.dart';
import 'package:math_solver/app/presentation/settings/widgets/custom_list_tile.dart';

class SettingsView extends StatelessWidget with ServicesMixin, Utilities {
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
          navigationService: navigationService, barText: 'Settings'),
      backgroundColor: ColorPalette.settingsColor,
      //
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: DeviceSize.height! * 0.6,
            ),
            child: Container(
              height: DeviceSize.height! * 0.4,
              width: DeviceSize.width!,
              margin: EdgeInsets.all(DeviceSize.width! * 0.06),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: tiles(),
            ),
          ),
          // TextButton(
          //     onPressed: () {
          //       hiveService.deleteMathFromDisk();
          //     },
          //     child: const Text("Clear cache")),
          // TextButton(
          //     onPressed: () {
          //       hiveService.changePremiumState(false);
          //     },
          //     child: const Text("Clear premium")),
          // TextButton(
          //     onPressed: () {
          //       hiveService.arrangeLaunch(true);
          //     },
          //     child: const Text("Clear onboarding")),
          // TextButton(
          //     onPressed: () {
          //       hiveService.deleteUsageFromDisk();
          //     },
          //     child: const Text("Clear usage")),
        ],
      ),
    );
  }

  Column tiles() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //
        Flexible(
          flex: 1,
          child: CustomListTile(
            leading: Icon(
              Icons.ios_share_rounded,
              size: DeviceSize.height! * 0.037,
            ),
            title: TextConstants.shareAppText,
            onTap: sharePressed,
          ),
        ),
        //
        Flexible(
          flex: 1,
          child: CustomListTile(
            leading: Icon(
              Icons.star_border_purple500_outlined,
              size: DeviceSize.height! * 0.04,
            ),
            title: TextConstants.rateUsText,
            onTap: ratePressed,
          ),
        ),
        //
        Flexible(
          flex: 1,
          child: CustomListTile(
            leading: Icon(
              Icons.mail_outline_rounded,
              size: DeviceSize.height! * 0.037,
            ),
            title: TextConstants.contactUsText,
            onTap: () => urlLaunch(TextConstants.mailUrl),
          ),
        ),
        //
        Flexible(
          flex: 1,
          child: CustomListTile(
            leading: Image.asset(
              AssetsPath.precacheList[7],
              height: DeviceSize.height! * 0.033,
              width: DeviceSize.width! * 0.07,
            ),
            title: TextConstants.termsOfServiceText,
            onTap: () => urlLaunch(TextConstants.flutterUrl),
          ),
        ),
        //
        Flexible(
          flex: 1,
          child: CustomListTile(
            onTap: () => urlLaunch(TextConstants.flutterUrl),
            leading: Icon(
              Icons.remove_red_eye_outlined,
              size: DeviceSize.height! * 0.037,
            ),
            title: TextConstants.privacyPolicyText,
          ),
        ),
        //
        Flexible(
          flex: 1,
          child: CustomListTile(
            leading: Icon(
              Icons.history,
              size: DeviceSize.height! * 0.037,
            ),
            onTap: () {
              navigationService.pushNamed('/historyView');
            },
            title: TextConstants.showHistoryText,
          ),
        )
      ],
    );
  }
}
