import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int index = 0;

  final bodies = [
    Center(child: FirstPage()),
    Center(
      child: SecondPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: bodies[index],
        // body: IndexedStack(
        //   children: bodies,
        //   index: index,
        // ),
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

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ThirdPage(),
          ),
        );
      },
      child: Text('Push Third page'),
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
