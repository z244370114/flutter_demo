// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter_rtmp/flutter_rtmp.dart';
//
// class RtmpPage extends StatefulWidget {
//   const RtmpPage({Key? key}) : super(key: key);
//
//   @override
//   _RtmpPageState createState() => _RtmpPageState();
// }
//
// class _RtmpPageState extends State<RtmpPage> {
//   final RtmpManager _manager = RtmpManager();
//   int seconds = 0;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   startCount() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         seconds += 1;
//       });
//     });
//   }
//
//   stopCount() {
//     _timer.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: SafeArea(
//         child: Stack(
//           // fit: StackFit.expand,
//           children: <Widget>[
//             RtmpView(
//               manager: _manager,
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Container(
//                       // height: 40,
//                       // color: Colors.white,
//                       // padding: EdgeInsets.only(top: 20),
//                       alignment: Alignment.topLeft,
//                       child: Flex(
//                         direction: Axis.horizontal,
//                         children: [
//                           ActionChip(
//                               label: Text("开始"),
//                               onPressed: () async {
//                                 // String config = await rootBundle
//                                 //     .loadString("src/testfile.json");
//                                 // Map param = jsonDecode(config);
//                                 // await _manager
//                                 //     .startLive(param["rtmpurl"] ?? "");
//                                 await _manager.living(
//                                     url: "rtmp://192.168.0.34:8086/live/zy");
//                                 setState(() {});
//                                 startCount();
//                               }),
//                           ActionChip(
//                               label: Text("暂停"),
//                               onPressed: () async {
//                                 await _manager.pauseLive();
//                                 setState(() {});
//                                 stopCount();
//                               }),
//                           ActionChip(
//                               label: Text("恢复"),
//                               onPressed: () async {
//                                 await _manager.resumeLive();
//                                 setState(() {});
//                                 startCount();
//                               }),
//                           ActionChip(
//                               label: Text("结束"),
//                               onPressed: () async {
//                                 await _manager.stopLive();
//                                 setState(() {});
//                                 stopCount();
//                               }),
//                           ActionChip(
//                               label: Text("切换摄像头"),
//                               onPressed: () async {
//                                 await _manager.switchCamera();
//                                 setState(() {});
//                               }),
//                         ],
//                       )),
//                   // Container(
//                   //   alignment: Alignment.topLeft,
//                   //   child: RichText(
//                   //       text: TextSpan(
//                   //           text:
//                   //               "快照信息 \n STATUS : ${_manager.snapShot?.status ?? 'NO'}\t\t",
//                   //           children: [TextSpan(text: "sec : $seconds")])),
//                   // )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
