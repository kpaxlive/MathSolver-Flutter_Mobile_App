
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/constants/themes.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/data/models/response_model.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';

class ListViewContainer extends StatelessWidget with ServicesMixin {
  ListViewContainer({super.key, required this.question});

  final ResponseModel question;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationService.pushNamedArguments('/solutionView', question.id);
      },
      child: Container(
        width: DeviceSize.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsPath.precacheList[9]),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              question.question,
              style: getCustomTextStyle(
                fontSize: DeviceSize.height! * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
