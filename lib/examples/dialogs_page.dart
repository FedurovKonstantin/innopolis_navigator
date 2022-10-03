import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogsPage extends StatefulWidget {
  const DialogsPage({Key? key}) : super(key: key);

  @override
  State<DialogsPage> createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  int counter = 0;

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
                  Text('counter:$counter'),
                  CounterButton(
                    onConfirmed: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                  const MaterialDialogButton(),
                  const CupertinoDialogButton(),
                  const AboutDialogButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final VoidCallback onConfirmed;

  const CounterButton({
    required this.onConfirmed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Counter'),
              content: const Text('Does increase counter?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        if (result ?? false) onConfirmed.call();
      },
      child: const Text("Push Counter Button"),
    );
  }
}

class MaterialDialogButton extends StatelessWidget {
  const MaterialDialogButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Title'),
              content: const Text('Body'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Push Material Dialog"),
    );
  }
}

class CupertinoDialogButton extends StatelessWidget {
  const CupertinoDialogButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('Title'),
              content: const Text('Body'),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('Yes'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: const Text('No'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Push Cupertino Dialog"),
    );
  }
}

class AboutDialogButton extends StatelessWidget {
  const AboutDialogButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showAboutDialog(
          context: context,
          applicationName: 'Amazing app',
          applicationVersion: '1.0',
        );
      },
      child: const Text("Push About Dialog"),
    );
  }
}
