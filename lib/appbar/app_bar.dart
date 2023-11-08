import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    var s = SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // 设置状态栏背景颜色
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标的亮度，dark表示黑色图标
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(' App Bar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 处理返回操作
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.red, // 修改图标颜色
          size: 30.0, // 修改图标大小
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.blue, // 修改图标颜色
          size: 30.0, // 修改图标大小
        ),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.greenAccent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.deepPurple, // 修改标题文本颜色
          fontSize: 24.0, // 修改标题文本字体大小
          fontWeight: FontWeight.bold, // 修改标题文本字体粗细
        ),
        toolbarHeight: 100,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 处理搜索操作
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // 处理更多操作
            },
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue, // 设置状态栏背景颜色
          statusBarIconBrightness: Brightness.dark, // 设置状态栏图标的亮度，dark表示黑色图标
        ),
        toolbarOpacity: 0.5,
        // bottomOpacity: 0.5,
      ),
      body: Container(),
    );
  }
}
