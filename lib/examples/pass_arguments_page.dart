import 'dart:math';

import 'package:flutter/material.dart';

class Routes {
  static const first = '/';
  static const second = '/second';
  static const secondV2 = '/secondV2';
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
      case Routes.secondV2:
        final arguments = settings.arguments as Map<String, String>;
        page = SecondPageV2(
          phrase: arguments['phrase']!,
        );
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
      settings: settings,
    );
  }
}

class PassArgumentsPage extends StatelessWidget {
  const PassArgumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
            Navigator.of(context).pushNamed(
              Routes.second,
              arguments: {
                'phrase': 'NaNaNa',
              },
            );
          },
          child: const Text('Say'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phrase =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What does the Fox say: ' + phrase['phrase']!),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Pop'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPageV2 extends StatelessWidget {
  final String phrase;

  const SecondPageV2({
    required this.phrase,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What the Fox say: ' + phrase),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Pop'),
            ),
          ],
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
