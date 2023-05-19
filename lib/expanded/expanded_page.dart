import 'package:flutter/material.dart';
import 'package:flutter_demo/utlis/colors_utlis.dart';

class ExpandedPage extends StatefulWidget {
  const ExpandedPage({Key? key}) : super(key: key);

  @override
  State<ExpandedPage> createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpandedPage"),
      ),
      body: Column(
        children: <Widget>[
          buildRow([0, 0, 0]),
          const SizedBox(
            height: 10,
          ),
          buildRow([0, 2, 1]),
          const SizedBox(
            height: 10,
          ),
          buildRow([1, 1, 1]),
          const SizedBox(
            height: 10,
          ),
          buildRow([2, 3, 3]),
          const SizedBox(
            height: 10,
          ),
          buildColumn([1, 2, 3]),
          const SizedBox(
            height: 10,
          ),
          buildColumn([2, 2, 4]),
        ],
      ),
    );
  }

  Widget buildRow(List<int> num) {
    return Row(
        children: num.map((e) => Expanded(
              flex: e,
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                color: ColorsUtils.randomColor(),
                child: Text(
                  'flex=$e',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )).toList());
  }
  Widget buildColumn(List<int> num) {
    return SizedBox(
      height: 200,
      child: Column(
          children: num.map((e) => Expanded(
                flex: e,
                child: Container(
                  alignment: Alignment.center,
                  color: ColorsUtils.randomColor(),
                  child: Text(
                    'flex=$e',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )).toList()),
    );
  }
}
