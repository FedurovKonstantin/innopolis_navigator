import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Some text"),
                    ),
                  );
                },
                child: Text('Show snack bar'),
              ),
            );
          },
        ),
      ),
    );
  }
}
