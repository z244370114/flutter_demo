import 'package:drift/drift.dart';
import 'package:flutter_demo/drift/tables.dart';

import 'database.dart';

part 'todos_items_dao.g.dart';

@DriftAccessor(tables: [TodoItems])
class TodoItemsDao extends DatabaseAccessor<AppDatabase>
    with _$TodoItemsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TodoItemsDao(AppDatabase db) : super(db);

  // Stream<List<TodoItems>> todosInCategory(Category category) {
  //   if (category == null) {
  //     return (select(todos)..where((t) => isNull(t.category))).watch();
  //   } else {
  //     return (select(todos)..where((t) => t.category.equals(category.id)))
  //         .watch();
  //   }
  // }

  Stream<List<TodoItem>> todosTodoItems() {
    return (select(todoItems)..where((t) => isNull(t.title))).watch();
  }

  Future<List<TodoItem>> limitTodos(int limit, {int? offset}) {
    return (select(todoItems)..limit(limit, offset: offset)).get();
  }

  Future<List<TodoItem>> sortEntriesAlphabetically() {
    return (select(todoItems)
          ..orderBy([
            (t) => OrderingTerm(expression: t.title, mode: OrderingMode.desc),
            // (t) => OrderingTerm(expression: t.title),
          ]))
        .get();
  }

  Stream<TodoItem> entryById(int id) {
    return (select(todoItems)..where((t) => t.id.equals(id))).watchSingle();
  }

  // Exposes `get` and `watch`
  MultiSelectable<TodoItem> pageOfTodos(int page, {int pageSize = 10}) {
    return select(todoItems)..limit(pageSize, offset: page);
  }

// Exposes `getSingle` and `watchSingle`
  SingleSelectable<TodoItem> selectableEntryById(int id) {
    return select(todoItems)..where((t) => t.id.equals(id));
  }

// Exposes `getSingleOrNull` and `watchSingleOrNull`
  SingleOrNullSelectable<TodoItem> entryFromExternalLink(int id) {
    return select(todoItems)..where((t) => t.id.equals(id));
  }
}
