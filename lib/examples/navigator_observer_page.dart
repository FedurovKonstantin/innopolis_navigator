import 'dart:math';

import 'package:flutter/material.dart';

class Routes {
  static const first = '/';
  static const second = '/second';
}

class NavigationService {
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
      settings: settings,
    );
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const FallbackPage(),
    );
  }
}

class DebugObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    print('${route.settings.name} did pop');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('${route.settings.name} did push');
  }
}

class NavigatorObserverPage extends StatelessWidget {
  const NavigatorObserverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        DebugObserver(),
      ],
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
            Navigator.of(context).pushNamed(Routes.second);
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

class AwesomePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  AwesomePageRoute({
    required this.child,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1, sin(pi * 4 * animation.value)),
                end: Offset.zero,
              ).animate(animation),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.3, end: 1).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(seconds: 2),
          reverseTransitionDuration: const Duration(seconds: 2),
          barrierColor: Colors.deepPurple,
        );
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
