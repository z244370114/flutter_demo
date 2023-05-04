import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField使用'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                  label: Text("label"),
                  icon: Icon(Icons.favorite),
                  iconColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: "hintText",
                  contentPadding: EdgeInsets.all(2),
                  counter: Text("counter"),
                  helperText: "helperText",
                  prefix: Icon(Icons.co2),
                  prefixIcon: Icon(Icons.abc_outlined),
                  suffixIcon: Icon(Icons.abc),
                  suffix: Text('suffix'),
                  hintStyle: TextStyle(color: Colors.amber),
                ),
                onEditingComplete: () {
                  print('onEditingComplete');
                },
                onChanged: (v) {
                  print('onChanged:' + v);
                },
                onSubmitted: (v) {
                  FocusScope.of(context).requestFocus(_focusNode);
                  print('onSubmitted:' + v);
                  _controller.clear();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
