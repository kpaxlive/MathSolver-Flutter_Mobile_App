import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_solver/app/core/constants/functions.dart';
import 'package:math_solver/app/core/device_sizes/device_sizes.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/presentation/home/state/math_bloc.dart';
import 'package:math_solver/app/presentation/paywall/state/paywall_bloc_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await Functions().setUp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ServicesMixin {
  late final bool isPremium = hiveService.getPreferences('premium') ?? false;
  late final bool isFirstLaunch =
      hiveService.getPreferences('firstLaunch') ?? true;

  @override
  Widget build(BuildContext context) {
    Functions().precache(context);
    DeviceSize().init(context);

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<MathSolverBloc>(
              create: (context) => MathSolverBloc(),
            ),
            BlocProvider<PayWallBloc>(create: (context) => PayWallBloc()),
          ],
          child: MaterialApp(
            title: "Final Project",
            debugShowCheckedModeBanner: false,
            navigatorKey: navigationService.navigatorKey,
            routes: navigationService.routes,
            initialRoute: isFirstLaunch
                ? '/welcomeView'
                : isPremium
                    ? '/homeView'
                    : '/paywallView',
          ),
        );
      },
    );
  }
}
