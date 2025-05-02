import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_demo/drift/database.dart';

import 'todos_items_dao.dart';

class DriftPage extends StatefulWidget {
  const DriftPage({Key? key}) : super(key: key);

  @override
  _DriftPageState createState() => _DriftPageState();
}

class _DriftPageState extends State<DriftPage> {
  late AppDatabase appDatabase;
  String content = "";

  late $AppDatabaseManager managers;
  List<TodoItem> onValue = [];

  late TodoItemsDao dao;
  final StreamController<TodoItem> _todoStreamController =
      StreamController<TodoItem>();

  Stream<TodoItem>? get stream => _todoStreamController.stream;

  @override
  void initState() {
    super.initState();
    appDatabase = AppDatabase();
    dao = TodoItemsDao(appDatabase);

    managers = appDatabase.managers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("drift"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      createTodoItem();
                    },
                    child: const Text('插入 insert'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      selectTodoItems();
                    },
                    child: const Text('查询 select'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      updateTodoItems();
                      setState(() {});
                    },
                    child: const Text('更新 update'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      deleteTodoItems();
                    },
                    child: const Text('删除 delete'),
                  ),
                  listWidget(onValue)
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var limitTodos = await dao.limitTodos(10, offset: 10);
                      setState(() {
                        print(limitTodos);
                        onValue = limitTodos;
                      });
                    },
                    child: const Text('查询 limit'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var limitTodos = await dao.sortEntriesAlphabetically();
                      setState(() {
                        print(limitTodos);
                        onValue = limitTodos;
                      });
                    },
                    child: const Text('排序 '),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      dao.entryById(20);
                      setState(() {});
                    },
                    child: const Text('单一  '),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var pageOfTodos = dao.pageOfTodos(10);
                      var limitTodos = await pageOfTodos.get();
                      setState(() {
                        onValue = limitTodos;
                      });
                    },
                    child: const Text('MultiSelectable  '),
                  ),
                  StreamBuilder<TodoItem>(
                    stream: dao.entryById(20),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      return SizedBox(
                        child: Text(""),
                        height: 50,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  listWidget(List<TodoItem> onValue) {
    return Column(
      children: onValue
          .map((item) => Column(
                children: [
                  Text(item.id.toString()),
                  Text(item.title),
                  Text(item.content),
                ],
              ))
          .toList(),
    );
  }

  Future<void> selectTodoItems() async {
    // Get all items
    managers.todoItems.get().then((onValue) {
      this.onValue = onValue;
      setState(() {});
    });
    // A stream of all the todo items, updated in real-time
    managers.todoItems.watch();

    // To get a single item, apply a filter and call `getSingle`
    await managers.todoItems.filter((f) => f.id(1)).getSingle();
  }

  Future<void> updateTodoItems() async {
    // 更新所有数据
    await managers.todoItems
        .update((o) => o(content: drift.Value('New Content')));

    // 根据条件更新部分数据
    await managers.todoItems
        .filter((f) => f.id.isIn([1, 2, 3]))
        .update((o) => o(content: drift.Value('New Content')));
  }

  Future<void> replaceTodoItems() async {
    // Replace a single item
    var obj = await managers.todoItems.filter((o) => o.id(1)).getSingle();
    obj = obj.copyWith(content: 'New Content');
    await managers.todoItems.replace(obj);

    // Replace multiple items
    var objs =
        await managers.todoItems.filter((o) => o.id.isIn([1, 2, 3])).get();
    objs = objs.map((o) => o.copyWith(content: 'New Content')).toList();
    await managers.todoItems.bulkReplace(objs);
  }

  Future<void> createTodoItem() async {
    // Create a new item
    await managers.todoItems
        .create((o) => o(title: 'aTitle', content: 'Content'));

    // We can also use `mode` and `onConflict` parameters, just
    // like in the `[InsertStatement.insert]` method on the table
    await managers.todoItems.create(
        (o) => o(title: 'dTitle', content: 'New Content'),
        mode: drift.InsertMode.replace);

    // We can also create multiple items at once
    await managers.todoItems.bulkCreate(
      (o) => [
        o(title: 'cTitle 1', content: 'Content 1'),
        o(title: 'fTitle 2', content: 'Content 2'),
      ],
    );
    setState(() {});
  }

  Future<void> deleteTodoItems() async {
    // Delete all items
    await managers.todoItems.delete();

    setState(() {
      this.onValue = [];
    });
    // Delete a single item
    await managers.todoItems.filter((f) => f.id(5)).delete();
  }
}
