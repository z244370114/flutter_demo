import 'package:flutter/material.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  // int currentPageIndex = 0;
  //
  // NavigationDestinationLabelBehavior labelBehavior =
  //     NavigationDestinationLabelBehavior.onlyShowSelected;
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: NavigationBar(
  //       labelBehavior: labelBehavior,
  //       onDestinationSelected: (int index) {
  //         setState(() {
  //           currentPageIndex = index;
  //         });
  //       },
  //       selectedIndex: currentPageIndex,
  //       destinations: const <Widget>[
  //         NavigationDestination(
  //           icon: Icon(Icons.explore),
  //           label: 'Explore',
  //         ),
  //         NavigationDestination(
  //           icon: Icon(Icons.commute),
  //           label: 'Commute',
  //         ),
  //         NavigationDestination(
  //           selectedIcon: Icon(Icons.bookmark),
  //           icon: Icon(Icons.bookmark_border),
  //           label: 'Saved',
  //         ),
  //       ],
  //     ),
  //     body: <Widget>[
  //       Container(
  //         color: Colors.red,
  //         alignment: Alignment.center,
  //         child: const Text('Page 1'),
  //       ),
  //       Container(
  //         color: Colors.green,
  //         alignment: Alignment.center,
  //         child: const Text('Page 2'),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         alignment: Alignment.center,
  //         child: const Text('Page 3'),
  //       ),
  //     ][currentPageIndex],
  //   );
  // }

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.green,
        indicatorColor: Colors.red,
        indicatorShape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.yellow, width: 2.0),
        ),
        surfaceTintColor: Colors.yellow,
        // animationDuration: Duration(milliseconds: 2000),
        // shadowColor: Colors.black,
        height: 70,
        elevation: 1,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            tooltip: "",
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Label behavior: ${labelBehavior.name}'),
            const SizedBox(height: 10),
            OverflowBar(
              spacing: 10.0,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      labelBehavior =
                          NavigationDestinationLabelBehavior.alwaysShow;
                    });
                  },
                  child: const Text('alwaysShow'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      labelBehavior =
                          NavigationDestinationLabelBehavior.onlyShowSelected;
                    });
                  },
                  child: const Text('onlyShowSelected'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      labelBehavior =
                          NavigationDestinationLabelBehavior.alwaysHide;
                    });
                  },
                  child: const Text('alwaysHide'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
