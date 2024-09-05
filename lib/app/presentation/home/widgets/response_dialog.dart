
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/presentation/home/state/math_bloc.dart';
import 'package:math_solver/app/presentation/home/state/math_state.dart';
import 'package:math_solver/app/presentation/home/widgets/info_alert_dialog.dart.dart';
import 'package:math_solver/app/presentation/home/widgets/solved_alert_dialog.dart';

Future<dynamic> showResponseDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    useSafeArea: false,
    builder: (context) {
      return BlocBuilder<MathSolverBloc, MathSolverState>(
        builder: (context, state) {
          //
          if (state is MathSolverLoading) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 0),
              contentPadding: EdgeInsets.all(0),
              content: InfoAlert(insideText: TextConstants.solvingText),
            );
          }
          //
          else if (state is MathSolverSuccess) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 0),
              contentPadding: const EdgeInsets.all(0),
              content: SolveAlert(snapData: state.response),
            );
          }
          //
          else if (state is MathSolverFailure) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 0),
              contentPadding: const EdgeInsets.all(0),
              content: InfoAlert(insideText: state.error),
            );
          }
          //
          else {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 0),
              contentPadding: EdgeInsets.all(0),
              content: InfoAlert(insideText: TextConstants.noResponseText),
            );
          }
        },
      );
    },
  );
}