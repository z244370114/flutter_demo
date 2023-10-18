import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScrollViewPage extends StatefulWidget {
  const CustomScrollViewPage({super.key});

  @override
  State<CustomScrollViewPage> createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  List<String> data = [
    "111",
    "222",
    "222",
    "222",
    "222",
    "222",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollViewPage"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'My App',
              style: TextStyle(color: Colors.red),
            ),
            floating: true,
            // 当向上滚动时，是否将应用栏固定在屏幕顶部
            pinned: true,
            // 是否始终显示应用栏，无论向上滚动多少
            expandedHeight: 100,
            // 展开的高度
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.asset('assets/googleplay.png', fit: BoxFit.cover),
            ),
          ),
          SliverPersistentHeader(
            delegate: MyPersistentHeaderDelegate(), // 委托对象，控制头部视图的行为和外观
            pinned: true, // 是否始终显示头部视图，无论向上滚动多少
          ),
          SliverFixedExtentList(
            itemExtent: 50, // 列表项的高度
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('FixedExtent Item $index'),
                );
              },
              childCount: 20, // 列表项的个数
            ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.all(150.w),
          //   sliver: SliverToBoxAdapter(
          //     child: Container(
          //       color: Colors.black54,
          //       child: Text("SliverToBoxAdapter"),
          //     ),
          //   ),
          // ),
          // SliverGrid.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     childAspectRatio: 1,
          //   ),
          //   itemCount: data.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     var item = data[index];
          //     return Card(
          //       elevation: 1,
          //       clipBehavior: Clip.hardEdge,
          //       child: Text(
          //         item.toString(),
          //         style: TextStyle(
          //           color: Colors.blueAccent,
          //           fontSize: 26,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return ListTile(
          //         title: Text('SliverList Item $index'),
          //       );
          //     },
          //     childCount: 10, // 列表项的个数
          //   ),
          // ),

        ],
      ),
    );
  }


}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 200,
      color: Colors.blueAccent,
      child: Text('My Header'),
    );
  }

  @override
  double get maxExtent => 100; // 头部视图的最大高度

  @override
  double get minExtent => 50; // 头部视图的最小高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // 是否需要重新构建头部视图
  }
}
