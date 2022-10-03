import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalsPage extends StatelessWidget {
  const ModalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ModalBottomSheetButton(),
                  CupertinoModalPopupButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ModalBottomSheetButton extends StatelessWidget {
  const ModalBottomSheetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.wine_bar_outlined,
                    ),
                    title: Text('Wine'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.bedroom_parent_outlined,
                    ),
                    title: Text('Bed'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text('Show ModalBottomSheet'),
    );
  }
}

class CupertinoModalPopupButton extends StatelessWidget {
  const CupertinoModalPopupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Text('Edit'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Text('Delete'),
                  isDestructiveAction: true,
                ),
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Text('Save'),
                  isDefaultAction: true,
                ),
              ],
            );
          },
        );
      },
      child: Text('Show CupertioModalPopup'),
    );
  }
}
