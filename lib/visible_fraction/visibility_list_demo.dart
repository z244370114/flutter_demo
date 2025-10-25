import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibilityListDemo extends StatefulWidget {
  const VisibilityListDemo({super.key});

  @override
  State<VisibilityListDemo> createState() => _VisibilityListDemoState();
}

class _VisibilityListDemoState extends State<VisibilityListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('检测即将可见的 item'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return VisibilityDetector(
            key: Key('item-$index'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0 && info.visibleFraction < 1) {
                // 👇 这个 item 即将滑动出来（部分可见）
                print('Item $index 正在进入可视区域 (visible: ${info.visibleFraction})');
              } else if (info.visibleFraction == 1) {
                // 完全可见
                print('Item $index 完全可见');
              }
            },
            child: ListTile(
              title: Text('Item $index'),
              tileColor: index % 2 == 0 ? Colors.grey[200] : null,
            ),
          );
        },
      ),
    );
  }
}
