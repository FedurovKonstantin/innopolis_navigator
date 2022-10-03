import 'package:flutter/cupertino.dart';

class CupertinoLikeNavigationPage extends StatelessWidget {
  const CupertinoLikeNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.wifi),
              label: 'Web',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ant),
              label: 'Ant',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Page 1 of tab $index'),
                ),
                child: Center(
                  child: CupertinoButton(
                    child: const Text('Next page'),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) {
                            return CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                middle: Text('Page 2 of tab $index'),
                              ),
                              child: Center(
                                child: CupertinoButton(
                                  child: const Text('Back'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
