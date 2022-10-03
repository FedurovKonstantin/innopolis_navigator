import 'dart:math';

import 'package:flutter/material.dart';

class Routes {
  static const first = '/';
  static const second = '/second';
}

class NavigationService {
  static final key = GlobalKey<NavigatorState>();

  static final navigator = key.currentState!;

  static openSecondPage() {
    navigator.pushNamed(Routes.second);
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Widget? page;
    switch (settings.name) {
      case Routes.first:
        page = const FirstPage();
        break;
      case Routes.second:
        page = const SecondPage();
        break;
      default:
        page = null;
    }
    if (page == null) {
      return null;
    }

    return MaterialPageRoute(
      builder: (context) => page!,
    );
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const FallbackPage(),
    );
  }
}

class NavigatorKeyPage extends StatelessWidget {
  const NavigatorKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.key,
      onGenerateRoute: NavigationService.onGenerateRoute,
      onUnknownRoute: NavigationService.onUnknownRoute,
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First',
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            NavigationService.openSecondPage();
          },
          child: const Text('Push'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second',
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Pop'),
        ),
      ),
    );
  }
}

class FallbackPage extends StatelessWidget {
  const FallbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fallback'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Pop'),
        ),
      ),
    );
  }
}
