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

  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const FallbackPage(),
    );
  }
}

class RouteAwarePage extends StatelessWidget {
  const RouteAwarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        NavigationService.routeObserver,
      ],
      onGenerateRoute: NavigationService.onGenerateRoute,
      onUnknownRoute: NavigationService.onUnknownRoute,
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with RouteAware {
  @override
  void didPopNext() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NavigationService.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    NavigationService.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First',
        ),
      ),
      body: Center(
        child: FutureBuilder(
            future: Future.delayed(
              const Duration(seconds: 1),
            ),
            builder: (contetx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.second);
                },
                child: const Text('Push'),
              );
            }),
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
