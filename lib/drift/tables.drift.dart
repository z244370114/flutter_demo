// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutter_demo/drift/tables.drift.dart' as i1;
import 'package:flutter_demo/drift/tables.dart' as i2;
import 'dart:ui' as i3;

typedef $$TodoItemsTableCreateCompanionBuilder = i1.TodoItemsCompanion
    Function({
  i0.Value<int> id,
  required String title,
  required String content,
  i0.Value<DateTime?> createdAt,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = i1.TodoItemsCompanion
    Function({
  i0.Value<int> id,
  i0.Value<String> title,
  i0.Value<String> content,
  i0.Value<DateTime?> createdAt,
});

class $$TodoItemsTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$TodoItemsTable> {
  $$TodoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => i0.ColumnFilters(column));
}

class $$TodoItemsTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$TodoItemsTable> {
  $$TodoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => i0.ColumnOrderings(column));
}

class $$TodoItemsTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$TodoItemsTable> {
  $$TodoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  i0.GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TodoItemsTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.$TodoItemsTable,
    i1.TodoItem,
    i1.$$TodoItemsTableFilterComposer,
    i1.$$TodoItemsTableOrderingComposer,
    i1.$$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (
      i1.TodoItem,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$TodoItemsTable, i1.TodoItem>
    ),
    i1.TodoItem,
    i0.PrefetchHooks Function()> {
  $$TodoItemsTableTableManager(
      i0.GeneratedDatabase db, i1.$TodoItemsTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$TodoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$$TodoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$$TodoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> title = const i0.Value.absent(),
            i0.Value<String> content = const i0.Value.absent(),
            i0.Value<DateTime?> createdAt = const i0.Value.absent(),
          }) =>
              i1.TodoItemsCompanion(
            id: id,
            title: title,
            content: content,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String title,
            required String content,
            i0.Value<DateTime?> createdAt = const i0.Value.absent(),
          }) =>
              i1.TodoItemsCompanion.insert(
            id: id,
            title: title,
            content: content,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TodoItemsTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.$TodoItemsTable,
    i1.TodoItem,
    i1.$$TodoItemsTableFilterComposer,
    i1.$$TodoItemsTableOrderingComposer,
    i1.$$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (
      i1.TodoItem,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$TodoItemsTable, i1.TodoItem>
    ),
    i1.TodoItem,
    i0.PrefetchHooks Function()>;
typedef $$CategoriesTableCreateCompanionBuilder = i1.CategoriesCompanion
    Function({
  i0.Value<int> id,
  required String name,
  required i3.Color color,
});
typedef $$CategoriesTableUpdateCompanionBuilder = i1.CategoriesCompanion
    Function({
  i0.Value<int> id,
  i0.Value<String> name,
  i0.Value<i3.Color> color,
});

class $$CategoriesTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i3.Color, i3.Color, int> get color =>
      $composableBuilder(
          column: $table.color,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => i0.ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i3.Color, int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);
}

class $$CategoriesTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.$CategoriesTable,
    i1.Category,
    i1.$$CategoriesTableFilterComposer,
    i1.$$CategoriesTableOrderingComposer,
    i1.$$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (
      i1.Category,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$CategoriesTable, i1.Category>
    ),
    i1.Category,
    i0.PrefetchHooks Function()> {
  $$CategoriesTableTableManager(
      i0.GeneratedDatabase db, i1.$CategoriesTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> name = const i0.Value.absent(),
            i0.Value<i3.Color> color = const i0.Value.absent(),
          }) =>
              i1.CategoriesCompanion(
            id: id,
            name: name,
            color: color,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String name,
            required i3.Color color,
          }) =>
              i1.CategoriesCompanion.insert(
            id: id,
            name: name,
            color: color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.$CategoriesTable,
    i1.Category,
    i1.$$CategoriesTableFilterComposer,
    i1.$$CategoriesTableOrderingComposer,
    i1.$$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (
      i1.Category,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$CategoriesTable, i1.Category>
    ),
    i1.Category,
    i0.PrefetchHooks Function()>;

class $TodoItemsTable extends i2.TodoItems
    with i0.TableInfo<$TodoItemsTable, i1.TodoItem> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  @override
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: i0.GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 32),
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true);
  static const i0.VerificationMeta _contentMeta =
      const i0.VerificationMeta('content');
  @override
  late final i0.GeneratedColumn<String> content = i0.GeneratedColumn<String>(
      'body', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _createdAtMeta =
      const i0.VerificationMeta('createdAt');
  @override
  late final i0.GeneratedColumn<DateTime> createdAt =
      i0.GeneratedColumn<DateTime>('created_at', aliasedName, true,
          type: i0.DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<i0.GeneratedColumn> get $columns => [id, title, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.TodoItem> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.TodoItem(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}body'])!,
      createdAt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends i0.DataClass implements i0.Insertable<i1.TodoItem> {
  final int id;
  final String title;
  final String content;
  final DateTime? createdAt;
  const TodoItem(
      {required this.id,
      required this.title,
      required this.content,
      this.createdAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['title'] = i0.Variable<String>(title);
    map['body'] = i0.Variable<String>(content);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = i0.Variable<DateTime>(createdAt);
    }
    return map;
  }

  i1.TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return i1.TodoItemsCompanion(
      id: i0.Value(id),
      title: i0.Value(title),
      content: i0.Value(content),
      createdAt: createdAt == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(createdAt),
    );
  }

  factory TodoItem.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  i1.TodoItem copyWith(
          {int? id,
          String? title,
          String? content,
          i0.Value<DateTime?> createdAt = const i0.Value.absent()}) =>
      i1.TodoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  TodoItem copyWithCompanion(i1.TodoItemsCompanion data) {
    return TodoItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class TodoItemsCompanion extends i0.UpdateCompanion<i1.TodoItem> {
  final i0.Value<int> id;
  final i0.Value<String> title;
  final i0.Value<String> content;
  final i0.Value<DateTime?> createdAt;
  const TodoItemsCompanion({
    this.id = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.content = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const i0.Value.absent(),
    required String title,
    required String content,
    this.createdAt = const i0.Value.absent(),
  })  : title = i0.Value(title),
        content = i0.Value(content);
  static i0.Insertable<i1.TodoItem> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? title,
    i0.Expression<String>? content,
    i0.Expression<DateTime>? createdAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  i1.TodoItemsCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? title,
      i0.Value<String>? content,
      i0.Value<DateTime?>? createdAt}) {
    return i1.TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = i0.Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends i2.Categories
    with i0.TableInfo<$CategoriesTable, i1.Category> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _nameMeta =
      const i0.VerificationMeta('name');
  @override
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final i0.GeneratedColumnWithTypeConverter<i3.Color, int> color =
      i0.GeneratedColumn<int>('color', aliasedName, false,
              type: i0.DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<i3.Color>(i1.$CategoriesTable.$convertercolor);
  @override
  List<i0.GeneratedColumn> get $columns => [id, name, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Category> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Category(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: i1.$CategoriesTable.$convertercolor.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}color'])!),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static i0.TypeConverter<i3.Color, int> $convertercolor =
      const i2.ColorConverter();
}

class Category extends i0.DataClass implements i0.Insertable<i1.Category> {
  final int id;
  final String name;
  final i3.Color color;
  const Category({required this.id, required this.name, required this.color});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['name'] = i0.Variable<String>(name);
    {
      map['color'] =
          i0.Variable<int>(i1.$CategoriesTable.$convertercolor.toSql(color));
    }
    return map;
  }

  i1.CategoriesCompanion toCompanion(bool nullToAbsent) {
    return i1.CategoriesCompanion(
      id: i0.Value(id),
      name: i0.Value(name),
      color: i0.Value(color),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<i3.Color>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<i3.Color>(color),
    };
  }

  i1.Category copyWith({int? id, String? name, i3.Color? color}) => i1.Category(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  Category copyWithCompanion(i1.CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class CategoriesCompanion extends i0.UpdateCompanion<i1.Category> {
  final i0.Value<int> id;
  final i0.Value<String> name;
  final i0.Value<i3.Color> color;
  const CategoriesCompanion({
    this.id = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.color = const i0.Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const i0.Value.absent(),
    required String name,
    required i3.Color color,
  })  : name = i0.Value(name),
        color = i0.Value(color);
  static i0.Insertable<i1.Category> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? name,
    i0.Expression<int>? color,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  i1.CategoriesCompanion copyWith(
      {i0.Value<int>? id, i0.Value<String>? name, i0.Value<i3.Color>? color}) {
    return i1.CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = i0.Variable<int>(
          i1.$CategoriesTable.$convertercolor.toSql(color.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}
