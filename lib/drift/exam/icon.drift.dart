// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutter_demo/drift/exam/icon.drift.dart' as i1;

typedef $ExamIconGroupCreateCompanionBuilder = i1.ExamIconGroupCompanion
    Function({
  required int id,
  required String name,
  required int total,
  required int sort,
  i0.Value<String?> cover,
  i0.Value<int?> step,
  i0.Value<int> rowid,
});
typedef $ExamIconGroupUpdateCompanionBuilder = i1.ExamIconGroupCompanion
    Function({
  i0.Value<int> id,
  i0.Value<String> name,
  i0.Value<int> total,
  i0.Value<int> sort,
  i0.Value<String?> cover,
  i0.Value<int?> step,
  i0.Value<int> rowid,
});

class $ExamIconGroupFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ExamIconGroup> {
  $ExamIconGroupFilterComposer({
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

  i0.ColumnFilters<int> get total => $composableBuilder(
      column: $table.total, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get cover => $composableBuilder(
      column: $table.cover, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get step => $composableBuilder(
      column: $table.step, builder: (column) => i0.ColumnFilters(column));
}

class $ExamIconGroupOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ExamIconGroup> {
  $ExamIconGroupOrderingComposer({
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

  i0.ColumnOrderings<int> get total => $composableBuilder(
      column: $table.total, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get cover => $composableBuilder(
      column: $table.cover, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get step => $composableBuilder(
      column: $table.step, builder: (column) => i0.ColumnOrderings(column));
}

class $ExamIconGroupAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.ExamIconGroup> {
  $ExamIconGroupAnnotationComposer({
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

  i0.GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  i0.GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  i0.GeneratedColumn<String> get cover =>
      $composableBuilder(column: $table.cover, builder: (column) => column);

  i0.GeneratedColumn<int> get step =>
      $composableBuilder(column: $table.step, builder: (column) => column);
}

class $ExamIconGroupTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.ExamIconGroup,
    i1.ExamIconGroupData,
    i1.$ExamIconGroupFilterComposer,
    i1.$ExamIconGroupOrderingComposer,
    i1.$ExamIconGroupAnnotationComposer,
    $ExamIconGroupCreateCompanionBuilder,
    $ExamIconGroupUpdateCompanionBuilder,
    (
      i1.ExamIconGroupData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.ExamIconGroup,
          i1.ExamIconGroupData>
    ),
    i1.ExamIconGroupData,
    i0.PrefetchHooks Function()> {
  $ExamIconGroupTableManager(i0.GeneratedDatabase db, i1.ExamIconGroup table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$ExamIconGroupFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$ExamIconGroupOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$ExamIconGroupAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> name = const i0.Value.absent(),
            i0.Value<int> total = const i0.Value.absent(),
            i0.Value<int> sort = const i0.Value.absent(),
            i0.Value<String?> cover = const i0.Value.absent(),
            i0.Value<int?> step = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.ExamIconGroupCompanion(
            id: id,
            name: name,
            total: total,
            sort: sort,
            cover: cover,
            step: step,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String name,
            required int total,
            required int sort,
            i0.Value<String?> cover = const i0.Value.absent(),
            i0.Value<int?> step = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.ExamIconGroupCompanion.insert(
            id: id,
            name: name,
            total: total,
            sort: sort,
            cover: cover,
            step: step,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $ExamIconGroupProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.ExamIconGroup,
    i1.ExamIconGroupData,
    i1.$ExamIconGroupFilterComposer,
    i1.$ExamIconGroupOrderingComposer,
    i1.$ExamIconGroupAnnotationComposer,
    $ExamIconGroupCreateCompanionBuilder,
    $ExamIconGroupUpdateCompanionBuilder,
    (
      i1.ExamIconGroupData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.ExamIconGroup,
          i1.ExamIconGroupData>
    ),
    i1.ExamIconGroupData,
    i0.PrefetchHooks Function()>;

class ExamIconGroup extends i0.Table
    with i0.TableInfo<ExamIconGroup, i1.ExamIconGroupData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  ExamIconGroup(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const i0.VerificationMeta _nameMeta =
      const i0.VerificationMeta('name');
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _totalMeta =
      const i0.VerificationMeta('total');
  late final i0.GeneratedColumn<int> total = i0.GeneratedColumn<int>(
      'total', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _sortMeta =
      const i0.VerificationMeta('sort');
  late final i0.GeneratedColumn<int> sort = i0.GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _coverMeta =
      const i0.VerificationMeta('cover');
  late final i0.GeneratedColumn<String> cover = i0.GeneratedColumn<String>(
      'cover', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _stepMeta =
      const i0.VerificationMeta('step');
  late final i0.GeneratedColumn<int> step = i0.GeneratedColumn<int>(
      'step', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<i0.GeneratedColumn> get $columns => [id, name, total, sort, cover, step];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_icon_group';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.ExamIconGroupData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover']!, _coverMeta));
    }
    if (data.containsKey('step')) {
      context.handle(
          _stepMeta, step.isAcceptableOrUnknown(data['step']!, _stepMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => const {};
  @override
  i1.ExamIconGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ExamIconGroupData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}name'])!,
      total: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}total'])!,
      sort: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}sort'])!,
      cover: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}cover']),
      step: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}step']),
    );
  }

  @override
  ExamIconGroup createAlias(String alias) {
    return ExamIconGroup(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ExamIconGroupData extends i0.DataClass
    implements i0.Insertable<i1.ExamIconGroupData> {
  final int id;
  final String name;
  final int total;
  final int sort;
  final String? cover;
  final int? step;
  const ExamIconGroupData(
      {required this.id,
      required this.name,
      required this.total,
      required this.sort,
      this.cover,
      this.step});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['name'] = i0.Variable<String>(name);
    map['total'] = i0.Variable<int>(total);
    map['sort'] = i0.Variable<int>(sort);
    if (!nullToAbsent || cover != null) {
      map['cover'] = i0.Variable<String>(cover);
    }
    if (!nullToAbsent || step != null) {
      map['step'] = i0.Variable<int>(step);
    }
    return map;
  }

  i1.ExamIconGroupCompanion toCompanion(bool nullToAbsent) {
    return i1.ExamIconGroupCompanion(
      id: i0.Value(id),
      name: i0.Value(name),
      total: i0.Value(total),
      sort: i0.Value(sort),
      cover: cover == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(cover),
      step: step == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(step),
    );
  }

  factory ExamIconGroupData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ExamIconGroupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      total: serializer.fromJson<int>(json['total']),
      sort: serializer.fromJson<int>(json['sort']),
      cover: serializer.fromJson<String?>(json['cover']),
      step: serializer.fromJson<int?>(json['step']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'total': serializer.toJson<int>(total),
      'sort': serializer.toJson<int>(sort),
      'cover': serializer.toJson<String?>(cover),
      'step': serializer.toJson<int?>(step),
    };
  }

  i1.ExamIconGroupData copyWith(
          {int? id,
          String? name,
          int? total,
          int? sort,
          i0.Value<String?> cover = const i0.Value.absent(),
          i0.Value<int?> step = const i0.Value.absent()}) =>
      i1.ExamIconGroupData(
        id: id ?? this.id,
        name: name ?? this.name,
        total: total ?? this.total,
        sort: sort ?? this.sort,
        cover: cover.present ? cover.value : this.cover,
        step: step.present ? step.value : this.step,
      );
  ExamIconGroupData copyWithCompanion(i1.ExamIconGroupCompanion data) {
    return ExamIconGroupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      total: data.total.present ? data.total.value : this.total,
      sort: data.sort.present ? data.sort.value : this.sort,
      cover: data.cover.present ? data.cover.value : this.cover,
      step: data.step.present ? data.step.value : this.step,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamIconGroupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('total: $total, ')
          ..write('sort: $sort, ')
          ..write('cover: $cover, ')
          ..write('step: $step')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, total, sort, cover, step);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ExamIconGroupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.total == this.total &&
          other.sort == this.sort &&
          other.cover == this.cover &&
          other.step == this.step);
}

class ExamIconGroupCompanion extends i0.UpdateCompanion<i1.ExamIconGroupData> {
  final i0.Value<int> id;
  final i0.Value<String> name;
  final i0.Value<int> total;
  final i0.Value<int> sort;
  final i0.Value<String?> cover;
  final i0.Value<int?> step;
  final i0.Value<int> rowid;
  const ExamIconGroupCompanion({
    this.id = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.total = const i0.Value.absent(),
    this.sort = const i0.Value.absent(),
    this.cover = const i0.Value.absent(),
    this.step = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  ExamIconGroupCompanion.insert({
    required int id,
    required String name,
    required int total,
    required int sort,
    this.cover = const i0.Value.absent(),
    this.step = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : id = i0.Value(id),
        name = i0.Value(name),
        total = i0.Value(total),
        sort = i0.Value(sort);
  static i0.Insertable<i1.ExamIconGroupData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? name,
    i0.Expression<int>? total,
    i0.Expression<int>? sort,
    i0.Expression<String>? cover,
    i0.Expression<int>? step,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (total != null) 'total': total,
      if (sort != null) 'sort': sort,
      if (cover != null) 'cover': cover,
      if (step != null) 'step': step,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.ExamIconGroupCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? name,
      i0.Value<int>? total,
      i0.Value<int>? sort,
      i0.Value<String?>? cover,
      i0.Value<int?>? step,
      i0.Value<int>? rowid}) {
    return i1.ExamIconGroupCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      total: total ?? this.total,
      sort: sort ?? this.sort,
      cover: cover ?? this.cover,
      step: step ?? this.step,
      rowid: rowid ?? this.rowid,
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
    if (total.present) {
      map['total'] = i0.Variable<int>(total.value);
    }
    if (sort.present) {
      map['sort'] = i0.Variable<int>(sort.value);
    }
    if (cover.present) {
      map['cover'] = i0.Variable<String>(cover.value);
    }
    if (step.present) {
      map['step'] = i0.Variable<int>(step.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamIconGroupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('total: $total, ')
          ..write('sort: $sort, ')
          ..write('cover: $cover, ')
          ..write('step: $step, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}
