// import 'package:flutter/material.dart';
// import 'package:flutter_rtmp_publisher/flutter_rtmp_publisher.dart';
//
// class VideoTuiTtmp extends StatefulWidget {
//   const VideoTuiTtmp({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _VideoTuiTtmpState createState() => _VideoTuiTtmpState();
// }
//
// class _VideoTuiTtmpState extends State<VideoTuiTtmp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter RTMP Demo'),
//       ),
//       body: Container(
//         child: RaisedButton(
//           child: Text("Start Stream"),
//           onPressed: () {
//             RTMPPublisher.streamVideo("rtmp://192.168.0.34:8086/live/zy");
//           },
//         ),
//       ),
//     );
//   }
// }
