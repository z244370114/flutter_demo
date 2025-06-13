// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutter_demo/drift/database.dart' as i1;
import 'package:flutter_demo/drift/tables.drift.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;

mixin $TodoItemsDaoMixin on i0.DatabaseAccessor<i1.AppDatabase> {
  i2.$TodoItemsTable get todoItems => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i2.$TodoItemsTable>('todo_items');
}
