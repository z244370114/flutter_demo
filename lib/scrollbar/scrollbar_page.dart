import 'package:flutter/material.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ScrollbarPage extends StatefulWidget {
  const ScrollbarPage({Key? key}) : super(key: key);

  @override
  _ScrollbarPageState createState() => _ScrollbarPageState();
}

class _ScrollbarPageState extends State<ScrollbarPage> {
  double _alignmentY = 0.0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VsScrollbar(
        controller: _scrollController,
        showTrackOnHover: true,
        isAlwaysShown: true,
        scrollbarFadeDuration: Duration(milliseconds: 500),
        scrollbarTimeToFade: Duration(milliseconds: 800),
        style: VsScrollbarStyle(
          hoverThickness: 10.0, // default 12.0
          radius: Radius.circular(10), // default Radius.circular(8.0)
          thickness: 10.0, // [ default 8.0 ]
          color: Colors.purple.shade900, // default ColorScheme Theme
        ),
        child: ListView.builder(
          controller: _scrollController,
          reverse: false,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                height: 45,
                alignment: Alignment.center,
                child: Text('$index'),
              ),
            );
          },
          itemCount: 30,
          itemExtent: 50,
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    ScrollMetrics metrics = notification.metrics;
    print('滚动组件最大滚动距离:${metrics.maxScrollExtent}');
    print('当前滚动位置:${metrics.pixels}');
    setState(() {
      _alignmentY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
    });
    return true;
  }

// @override
// Widget build(BuildContext context) {
//   return NotificationListener<ScrollNotification>(
//     onNotification: _handleScrollNotification,
//     child: Stack(
//       alignment: Alignment.topRight,
//       children: <Widget>[
//         ListView.builder(
//           reverse: false,
//           itemBuilder: (BuildContext context, int index) {
//             return Card(
//               child: Container(
//                 height: 45,
//                 alignment: Alignment.center,
//                 child: Text('$index'),
//               ),
//             );
//           },
//           itemCount: 30,
//           itemExtent: 50,
//         ),
//         //滚动条
//         Container(
//           alignment: Alignment(1, _alignmentY),
//           height: 100,
//           width: 20,
//           color: Colors.red,
//         )
//       ],
//     ),
//   );
// }
}
