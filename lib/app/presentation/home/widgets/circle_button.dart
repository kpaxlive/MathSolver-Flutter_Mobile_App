
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceSize.height! * .18,
      width: DeviceSize.width!,
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(height: DeviceSize.height! * .03,),
            SizedBox(
              height: DeviceSize.height! * 0.15,
              child: GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  AssetsPath.precacheList[6],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
