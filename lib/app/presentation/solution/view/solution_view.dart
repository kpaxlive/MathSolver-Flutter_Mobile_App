
import 'package:flutter/material.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/constants/themes.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/core/widgets/general_appbar.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/presentation/solution/widgets/solution_container.dart';

class SolutionView extends StatelessWidget with ServicesMixin{
  SolutionView({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final Map question = hiveService.getMathItem(id);

    return Scaffold(
      backgroundColor: ColorPalette.settingsColor,
      appBar: GeneralAppBar(
          navigationService: navigationService, barText: "Solution"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: DeviceSize.height! * 0.02,
              ),
              //
              Text(
                question['date'],
                style: getCustomTextStyle(
                  fontSize: DeviceSize.height! * 0.020,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //
              SolutionContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question',
                      style: getCustomTextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        question['math'].question,
                        style: getCustomTextStyle(
                            fontSize: DeviceSize.height! * 0.022,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //
              SolutionContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Solution',
                      style: getCustomTextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        question['math'].result,
                        style: getCustomTextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //
              Container(
                width: DeviceSize.width,
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Solution",
                      style: getCustomTextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: question['math'].solutionSteps.length,
                          itemBuilder: (context, index) {
                            final String step = question['math'].solutionSteps[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: DeviceSize.height! * 0.02),
                              child: Text(
                                step,
                                style: getCustomTextStyle(
                                    fontSize: DeviceSize.height! * 0.022,
                                    fontWeight: FontWeight.w400),
                              ),
                            );
                          },
                        ),
                        Text("Solution",
                            style: getCustomTextStyle(
                                fontSize: 26, fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(question['math'].result,
                              style: getCustomTextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: DeviceSize.height! * 0.070,
              )
            ],
          ),
        ),
      ),
    );
  }
}
