
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/constants/themes.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/presentation/paywall/widgets/leading_list.dart';
import 'package:math_solver/app/presentation/paywall/widgets/paywall_list.dart';

class PayWallView extends StatelessWidget with ServicesMixin {
  PayWallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: DeviceSize.height! * 0.7,
              width: DeviceSize.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(
                    AssetsPath.precacheList[11],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: DeviceSize.height!,
              width: DeviceSize.width,
              child: Column(
                children: [
                  SizedBox(
                    height: DeviceSize.height! * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () =>
                            navigationService.pushReplacementNamed('/homeView'),
                        child: Image.asset(
                          AssetsPath.precacheList[4],
                          height: DeviceSize.height! * 0.07,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DeviceSize.height! * 0.005),
                  //
                  Image.asset(AssetsPath.precacheList[5],
                      height: DeviceSize.height! * 0.14,
                      width: DeviceSize.width! * 0.39),
                  //
                  SizedBox(height: DeviceSize.height! * 0.03),
                  //
                  Text("Get Premium!",
                      style: getCustomTextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorPalette.buttonColor)),
                  //
                  SizedBox(
                    height: DeviceSize.height! * 0.02,
                  ),
                  const LeadingList(),
                ],
              ),
            ),
            const PayWallList(),
          ],
        ));
  }
}
