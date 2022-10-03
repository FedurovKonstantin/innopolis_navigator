import 'package:flutter/material.dart';

class WillPopPage extends StatefulWidget {
  const WillPopPage({Key? key}) : super(key: key);

  @override
  State<WillPopPage> createState() => _WillPopPageState();
}

class _WillPopPageState extends State<WillPopPage> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SecondPage(),
                        ),
                      );
                      print(result);
                    },
                    child: const Text("Push"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool shouldAllowPop = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldAllowPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Second',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'shouldAllowPop: $shouldAllowPop',
              ),
              TextButton(
                onPressed: () => setState(() {
                  shouldAllowPop = !shouldAllowPop;
                }),
                child: const Text('toggle'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(shouldAllowPop);
                  // Navigator.of(context).maybePop(shouldAllowPop);
                },
                child: const Text('Pop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
