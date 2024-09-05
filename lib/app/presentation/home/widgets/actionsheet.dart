
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_solver/app/core/constants/color_palette.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/core/constants/themes.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/presentation/home/state/math_bloc.dart';
import 'package:math_solver/app/presentation/home/state/math_event.dart';

class ActionSheet extends StatelessWidget with ServicesMixin {
  ActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(TextConstants.addMathProblemText,
          style: getCustomTextStyle(
              fontSize: DeviceSize.height! * 0.018,
              color: ColorPalette.greyShade600)),
      //
      actions: <Widget>[
        CupertinoActionSheetAction(
            onPressed: () async {
              navigationService.goBack();
              context.read<MathSolverBloc>().add(CaptureImageEvent());
            },
            child: Text(
              TextConstants.takePictureText,
              style: getCustomTextStyle(
                fontSize: DeviceSize.height! * 0.026,
                color: ColorPalette.actionButtonColor,
              ),
            )),
        //
        CupertinoActionSheetAction(
            onPressed: () async {
              navigationService.goBack();
              context.read<MathSolverBloc>().add((UploadImageEvent()));
            },
            child: Text(TextConstants.uploadFromPhotosText,
                style: getCustomTextStyle(
                  fontSize: DeviceSize.height! * 0.026,
                  color: ColorPalette.actionButtonColor,
                ))),
      ],
      //
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          navigationService.goBack();
        },
        child: Text(TextConstants.cancelText,
            style: getCustomTextStyle(
                fontSize: DeviceSize.height! * 0.027,
                color: ColorPalette.redColor,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
