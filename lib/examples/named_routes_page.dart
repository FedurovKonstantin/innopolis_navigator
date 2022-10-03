import 'package:flutter/material.dart';

class Routes {
  static const first = '/';
  static const second = '/second';
  static const third = '/third';
}

class NavigationService {
  static final routes = <String, Widget Function(BuildContext)>{
    Routes.first: (context) => const FirstPage(),
    Routes.second: (context) => const SecondPage(),
    Routes.third: (context) => const ThirdPage(),
  };
}

class NamedRoutesPage extends StatelessWidget {
  const NamedRoutesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: NavigationService.routes,
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
            Navigator.of(context).pushNamed(Routes.third);
          },
          child: const Text('Push'),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third',
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).popUntil(
              ModalRoute.withName(Routes.first),
            );
          },
          child: const Text('Pop'),
        ),
      ),
    );
  }
}
