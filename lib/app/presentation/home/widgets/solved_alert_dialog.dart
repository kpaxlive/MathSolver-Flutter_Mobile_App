
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/constants/themes.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/core/widgets/continue_button.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';

class SolveAlert extends StatelessWidget with ServicesMixin {
  SolveAlert({super.key, required this.snapData});

  // ignore: prefer_typing_uninitialized_variables
  final snapData;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: DeviceSize.height! * 0.9,
        maxWidth: DeviceSize.width! * 0.9,
      ),
      child: IntrinsicHeight(
        child: Container(
          padding:
              const EdgeInsets.only(top: 35, left: 35, right: 35, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                TextConstants.solvedText,
                style: getCustomTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
              //
              SizedBox(height: DeviceSize.height! * 0.03),
              //
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          snapData.question,
                          maxLines: 4,
                          overflow: TextOverflow.fade,
                          style: getCustomTextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              SizedBox(height: DeviceSize.height! * 0.045),
              //
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapData.result,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: getCustomTextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              //
              SizedBox(height: DeviceSize.height! * 0.03),
              //
              Align(
                alignment: Alignment.bottomCenter,
                child: ContinueButton(
                  buttonWidth: DeviceSize.width! * 0.99,
                  insideText: TextConstants.showSolvingStepsText,
                  onTap: () {
                    navigationService.pushNamedArguments(
                        '/solutionView', snapData.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
