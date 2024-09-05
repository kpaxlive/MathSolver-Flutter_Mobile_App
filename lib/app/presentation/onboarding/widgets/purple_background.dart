
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class PurpleBackground extends StatelessWidget {
  const PurpleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: DeviceSize.height! * 1.2,
        width: DeviceSize.width,
        decoration:  BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(AssetsPath.precacheList[11]),
            fit: BoxFit.fill,
          ),
        ));
  }
}
