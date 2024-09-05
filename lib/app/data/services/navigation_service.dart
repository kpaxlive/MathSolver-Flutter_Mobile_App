
import 'package:flutter/material.dart';
import 'package:math_solver/app/presentation/history/view/history_view.dart';
import 'package:math_solver/app/presentation/home/view/home_view.dart';
import 'package:math_solver/app/presentation/onboarding/views/onboarding_all.dart';
import 'package:math_solver/app/presentation/onboarding/views/welcome_view_.dart';
import 'package:math_solver/app/presentation/paywall/view/paywall_view.dart';
import 'package:math_solver/app/presentation/settings/view/settings_view.dart';
import 'package:math_solver/app/presentation/solution/view/solution_view.dart';


class NavigationService {
  late final GlobalKey<NavigatorState> _navigatorKey;

  NavigationService() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  final Map<String, Widget Function(BuildContext)> _routes = {
    '/welcomeView' :(context) =>  WelcomeView(),
    '/onboardingView': (context) =>   OnBoardingAll(),
    '/settingsView':(context) =>   SettingsView(),
    '/homeView': (context) =>   HomeView(),
    '/solutionView':(context) =>  SolutionView(),
    '/paywallView': (context) =>   PayWallView(),
    '/historyView':(context) =>   HistoryView(),
  };

  GlobalKey<NavigatorState>? get navigatorKey {
    return _navigatorKey;
  }

  Map<String, Widget Function(BuildContext)> get routes {
    return _routes;
  }

  void pushNamed(String routeName)
  {
    _navigatorKey.currentState?.pushNamed(routeName);
  }

  void pushNamedArguments(String routeName, arguments)
  {
    _navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName)
  {
    _navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void goBack()
  {
    _navigatorKey.currentState?.pop();
  }
}
