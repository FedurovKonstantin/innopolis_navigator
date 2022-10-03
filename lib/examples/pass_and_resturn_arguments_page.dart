import 'package:flutter/material.dart';

class PassAndReturnArguments extends StatefulWidget {
  const PassAndReturnArguments({Key? key}) : super(key: key);

  @override
  State<PassAndReturnArguments> createState() => _PassAndReturnArgumentsState();
}

class _PassAndReturnArgumentsState extends State<PassAndReturnArguments> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
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
                Text(
                  counter.toString(),
                ),
                TextButton(
                  onPressed: () async {
                    final newCounter = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SecondPage(
                          counter: counter,
                        ),
                      ),
                    );
                    setState(() {
                      counter = newCounter ?? 0;
                    });
                  },
                  child: const Text('Push'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SecondPage extends StatefulWidget {
  int counter;

  SecondPage({
    required this.counter,
    Key? key,
  }) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
            Text(
              widget.counter.toString(),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.counter = widget.counter + 1;
                });
              },
              child: const Text('Increase'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(widget.counter);
              },
              child: const Text('Pop'),
            ),
          ],
        ),
      ),
    );
  }
}
