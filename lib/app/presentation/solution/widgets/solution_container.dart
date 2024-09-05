
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class SolutionContainer extends StatelessWidget {
  const SolutionContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: DeviceSize.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.purple.shade50,
                offset: const Offset(0, 4),
                blurRadius: 50,
                spreadRadius: 15,
              )
            ]),
        child: IntrinsicHeight(child: child));
  }
}
