import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    // 每个选项对应的页面或小部件
    // 可以根据需要替换为自己的页面或小部件
    Text('首页'),
    Text('搜索'),
    Text('设置'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试脚手架'),
      ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      endDrawer: Container(
        color: Colors.white,
        width: 200,
        child: Center(
          child: Column(
            children: [
              Text('测试endDrawer'),
              Text('测试endDrawer'),
            ],
          ),
        ),
      ),
      drawer: Container(
        color: Colors.white,
        width: 200,
        child: Center(
          child: Column(
            children: [
              Text('测试drawer'),
              Text('测试drawer'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '搜索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomEnd,
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            // 按钮1的点击事件处理逻辑
          },
          child: Text('按钮1'),
        ),
        TextButton(
          onPressed: () {
            // 按钮2的点击事件处理逻辑
          },
          child: Text('按钮2'),
        ),
      ],
    );
  }
}
