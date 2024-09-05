
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.onTap,
    this.insideText = "Continue",
    required this.buttonWidth,
  });

  final double buttonWidth;
  final VoidCallback onTap;
  final String insideText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: DeviceSize.height! * 0.074,
        width: buttonWidth * 0.85,
        decoration: const BoxDecoration(
            color: ColorPalette.buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: Center(
            child: Text(
          insideText,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
        )),
      ),
    );
  }
}
