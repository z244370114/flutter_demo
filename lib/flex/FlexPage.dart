import 'package:flutter/material.dart';

class FlexPage extends StatefulWidget {
  const FlexPage({Key? key}) : super(key: key);

  @override
  State<FlexPage> createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  static TextStyle textStyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  final Widget blueBox = Container(
    alignment: Alignment.center,
    color: Colors.blue,
    height: 20,
    width: 30,
    child: Text('1', style: textStyle),
  );

  final Widget redBox = Container(
    alignment: Alignment.center,
    color: Colors.red,
    height: 30,
    width: 40,
    child: Text('2', style: textStyle),
  );

  final Widget greenBox = Container(
    alignment: Alignment.center,
    color: Colors.green,
    height: 20,
    width: 20,
    child: Text('3', style: textStyle),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flex使用'),
      ),
      body: Wrap(
          // children: Axis.values
          // children: MainAxisAlignment.values
          children: CrossAxisAlignment.values
              .map((mode) => Column(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(5),
                        width: 160,
                        height: 80,
                        color: Colors.grey.withAlpha(33),
                        child: _buildItem(mode)),
                    Text(mode.toString().split('.')[1])
                  ]))
              .toList()),
    );
  }

  // Widget _buildItem(mode) => Flex(
  //       direction: mode,
  //       children: <Widget>[blueBox, redBox, greenBox],
  //     );

  // Widget _buildItem(mode) => Flex(
  //       direction: Axis.horizontal,
  //       mainAxisAlignment: mode,
  //       children: <Widget>[blueBox, redBox, greenBox],
  //     );

  Widget _buildItem(mode) => Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: mode,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[blueBox, redBox, greenBox],
      );

}