import 'package:flutter/material.dart';
import 'package:flutter_demo/scaffold/scaffold_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_video_info/youtube.dart';

import 'appbar/app_bar.dart';
import 'bloc/bloc_app.dart';
import 'curve/curve_canvas.dart';
import 'customscrollview/custom_scroll_view.dart';
import 'expanded/expanded_page.dart';
import 'flex/FlexPage.dart';
import 'input/TextFieldPage.dart';
import 'markdown/markdown_page.dart';
import 'navigationbar/navigation_bar.dart';
import 'navigationrail/navigation_rail.dart';
import 'picture_recorder/picture_recorder_page.dart';
import 'positioned/positioned_page.dart';
import 'scrollbar/scrollbar_page.dart';
import 'tabs/tabs_page.dart';
import 'video/video_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'view/login_page.dart';

void main() {
  runApp(const MyApp());
  // runApp(const BlocApp());
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
          // localizationsDelegates: const [
          //   AppLocalizations.localizationsDelegates, // Add this line
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // supportedLocales: const [
          //   Locale('en'), // English
          //   Locale('es'), // Spanish
          // ],
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          // home:  MyHomePage(title: AppLocalizations.of(context)!.helloWorld),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AppBarPage()));
                },
                child: const Text('AppBarPage'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CustomScrollViewPage()));
                },
                child: const Text('CustomScrollViewPage'),
              ),
              ElevatedButton(
                onPressed: () async {
                  YoutubeDataModel videoData = await YoutubeData.getData(
                      "https://www.youtube.com/watch?v=Ek1QD7AH9XQ");
                  print(videoData);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TabsPage()));
                },
                child: const Text('TabsPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationRails()));
                },
                child: const Text('NavigationRails'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationBars()));
                },
                child: const Text('NavigationBars'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                child: const Text('LoginPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MarkdownPage()));
                },
                child: const Text('MarkdownPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PositionedPage()));
                },
                child: const Text('PositionedPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExpandedPage()));
                },
                child: const Text('ExpandedPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScaffoldPage()));
                },
                child: const Text('Scaffold'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextFieldPage()));
                },
                child: const Text('TextFieldPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FlexPage()));
                },
                child: const Text('FlexPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CurveCanvas()));
                },
                child: const Text('跳转曲线图'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScrollbarPage()));
                },
                child: const Text('跳转滚动条'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PictureRecorderPage()));
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
