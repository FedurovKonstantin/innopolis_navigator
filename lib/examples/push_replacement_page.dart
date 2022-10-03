import 'package:flutter/material.dart';

class PushReplacementPage extends StatelessWidget {
  const PushReplacementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'First',
              ),
            ),
            body: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SecondPage(),
                    ),
                  );
                },
                child: const Text("Replace"),
              ),
            ),
          );
        },
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Pop'),
        ),
      ),
    );
  }
}
