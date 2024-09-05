
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class RotatingImage extends StatefulWidget {
  const RotatingImage({super.key});

  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        AssetsPath.precacheList[10],
        height: DeviceSize.height! * 0.12,
      ),
    );
  }
}
