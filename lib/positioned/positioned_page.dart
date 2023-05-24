import 'package:flutter/material.dart';
import 'package:flutter_demo/utlis/colors_utlis.dart';

class PositionedPage extends StatefulWidget {
  const PositionedPage({Key? key}) : super(key: key);

  @override
  State<PositionedPage> createState() => _PositionedPageState();
}

class _PositionedPageState extends State<PositionedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Positioned"),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            width: 150,
            height: 150,
            // top: 10,
            // bottom: 10,
            // left: 10,
            // right: 10,
            child: Container(
              color: ColorsUtils.randomColor(),
              child: Text("1"),
            ),
          ),
          Positioned(
            width: 150,
            height: 150,
            top: 50,
            // bottom: 10,
            left: 50,
            // right: 10,
            child: Container(
              color: ColorsUtils.randomColor(),
              child: Text("2"),
            ),
          ),
        ],
      ),
    );
  }
}
