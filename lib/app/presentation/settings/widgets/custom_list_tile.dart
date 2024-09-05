
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    required this.onTap,
  });

  final String title;
  final Widget leading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
            fontSize: DeviceSize.height! * 0.02, fontWeight: FontWeight.w600),
      ),
    );
  }
}
