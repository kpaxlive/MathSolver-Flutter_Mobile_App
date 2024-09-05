
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/presentation/paywall/state/paywall_bloc_bloc.dart';
import 'package:math_solver/app/presentation/paywall/state/paywall_bloc_event.dart';
import 'package:math_solver/app/presentation/paywall/widgets/paywall_button.dart';
import 'package:math_solver/app/presentation/paywall/widgets/paywall_choices.dart';

class PayWallList extends StatelessWidget {
  const PayWallList({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              bottom: 0,
              child: BlocBuilder<PayWallBloc, PayWallState>(
                builder: (context, state) {
                  return SizedBox(
                    height: DeviceSize.height! * 0.46,
                    width: DeviceSize.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: DeviceSize.height! * 0.052,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<PayWallBloc>()
                                .add(PayWallToggleMonthly());
                          },
                          child: PayWallChoices(
                            insideText: "Monthly   \$35",
                            checked: state.monthly,
                          ),
                        ),
                        //
                        GestureDetector(
                            onTap: () {
                              context
                                  .read<PayWallBloc>()
                                  .add(PayWallToggleAnnual());
                            },
                            child: PayWallChoices(
                              insideText: "Annual     \$15",
                              checked: state.annual,
                            )),
                        //
                        SizedBox(
                          height: DeviceSize.height! * 0.06,
                        ),
                        Center(
                            child: PayWallButton(
                                monthly: state.monthly, annual: state.annual)),
                      ],
                    ),
                  );
                },
              ),
            );
  }
}
