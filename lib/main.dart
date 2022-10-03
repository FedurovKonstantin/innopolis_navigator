import 'package:flutter/material.dart';
import 'package:innopolis_navigator/examples/cupertino_like_navigation_page.dart';
import 'package:innopolis_navigator/examples/dialogs_page.dart';
import 'package:innopolis_navigator/examples/navigator_key_page.dart';
import 'package:innopolis_navigator/examples/navigator_observer_page.dart';
import 'package:innopolis_navigator/examples/nested_navigation_page.dart';
import 'package:innopolis_navigator/examples/on_generate_initial_routes_page.dart';
import 'package:innopolis_navigator/examples/pass_arguments_page.dart';
import 'package:innopolis_navigator/examples/pickers_page.dart';
import 'package:innopolis_navigator/examples/push_replacement_page.dart';
import 'package:innopolis_navigator/examples/named_routes_page.dart';
import 'package:innopolis_navigator/examples/pass_and_resturn_arguments_page.dart';
import 'package:innopolis_navigator/examples/snack_bar_page.dart';
import 'package:innopolis_navigator/examples/will_pop_page.dart';

import 'examples/navigation_bar_page.dart';
import 'examples/on_generate_routes_page.dart';
import 'examples/push_pop_page.dart';
import 'examples/route_aware_page.dart';
import 'examples/modals_page.dart';

void main() {
  runApp(const MyApp(
    example: Routes.example1PushPop,
  ));
}

enum Routes {
  example1PushPop,
  exmaple2PassAndReturnArguments,
  exmaple3PushReplacement,
  exmaple4NamedRoutes,
  exmaple5OnGenerateRoutes,
  exmaple6PassArgumentsV2,
  example7OnGenerateInitialRoutes,
  exmaple8WillPopScope,
  exmaple9NavigatorKey,
  example10navigatorObserver,
  example11routeAware,
  example12Dialogs,
  example13Pickers,
  example14Modals,
  example15SnackBar,
  example16NavigationrBar,
  example17NestedNavigation,
  example18CupertinoLikeNavigation,
}

class MyApp extends StatelessWidget {
  final Routes example;

  const MyApp({
    required this.example,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (example) {
      case Routes.example1PushPop:
        return const PushPopPage();
      case Routes.exmaple2PassAndReturnArguments:
        return const PassAndReturnArguments();
      case Routes.exmaple3PushReplacement:
        return const PushReplacementPage();
      case Routes.exmaple8WillPopScope:
        return const WillPopPage();
      case Routes.exmaple4NamedRoutes:
        return const NamedRoutesPage();
      case Routes.exmaple5OnGenerateRoutes:
        return const OnGenerateRoutesPage();
      case Routes.example7OnGenerateInitialRoutes:
        return const OnGenerateInitialRoutesPage();
      case Routes.exmaple6PassArgumentsV2:
        return const PassArgumentsPage();
      case Routes.exmaple9NavigatorKey:
        return const NavigatorKeyPage();
      case Routes.example10navigatorObserver:
        return const NavigatorObserverPage();
      case Routes.example11routeAware:
        return const RouteAwarePage();
      case Routes.example12Dialogs:
        return const DialogsPage();
      case Routes.example13Pickers:
        return const PickersPage();
      case Routes.example14Modals:
        return const ModalsPage();
      case Routes.example15SnackBar:
        return const SnackBarPage();
      case Routes.example16NavigationrBar:
        return const NavigationBarPage();
      case Routes.example17NestedNavigation:
        return const NestedNavigationPage();
      case Routes.example18CupertinoLikeNavigation:
        return const CupertinoLikeNavigationPage();

      default:
    }
    return Container();
  }
}
