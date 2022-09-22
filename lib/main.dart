import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bloc/bloc_app.dart';
import 'curve/curve_canvas.dart';
import 'picture_recorder/picture_recorder_page.dart';
import 'scrollbar/scrollbar_page.dart';
import 'video/video_screen.dart';

void main() {
  // runApp(const MyApp());
  runApp(const BlocApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(2000, 1200),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'SourceCodePro',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CurveCanvas()));
              },
              child: const Text('跳转曲线图'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScrollbarPage()));
              },
              child: const Text('跳转滚动条'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PictureRecorderPage()));
              },
              child: const Text('PictureRecorderPage'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => RtmpPage()));
            //   },
            //   child: const Text('RtmpPage'),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _gotoHomePage(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //跳转到主界面
  _gotoHomePage(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return VideoScreen(
          url:
              "https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv");
    }));
  }
}
