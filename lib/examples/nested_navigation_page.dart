import 'package:flutter/material.dart';

class NestedNavigationPage extends StatefulWidget {
  const NestedNavigationPage({Key? key}) : super(key: key);

  @override
  State<NestedNavigationPage> createState() => _NestedNavigationPageState();
}

class _NestedNavigationPageState extends State<NestedNavigationPage> {
  int index = 0;

  final bodies = [
    Center(child: FirstPage()),
    Center(
      child: SecondWrapperPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: NavigationService.onGenerateRoute,
      home: Scaffold(
        body: IndexedStack(
          children: bodies,
          index: index,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.fastfood_outlined,
              ),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
              ),
              label: 'Music',
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1), (value) => value + 1),
      builder: (context, snapshot) => Text(
        snapshot.data.toString(),
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

class SecondWrapperPage extends StatelessWidget {
  const SecondWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: NavigationService.onGenerateRoute,
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.third);

          // Navigator.of(context,rootNavigator: true).pushNamed(Routes.third);
        },
        child: Text('Push Third page'),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Pop'),
        ),
      ),
    );
  }
}

class Routes {
  static const second = '/';
  static const third = '/third';
}

class NavigationService {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Widget? page;
    switch (settings.name) {
      case Routes.second:
        page = const SecondPage();
        break;
      case Routes.third:
        page = const ThirdPage();
        break;
      default:
        page = null;
    }
    if (page == null) {
      return null;
    }

    return MaterialPageRoute(
      builder: (_) => page!,
    );
  }
}
