// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:flutter_demo/drift/exam/exam1.drift.dart' as i1;

typedef $ExamCreateCompanionBuilder = i1.ExamCompanion Function({
  i0.Value<int> id,
  i0.Value<String?> character,
  required int qType,
  i0.Value<String?> qTypeTag,
  i0.Value<String?> qDetailTag,
  i0.Value<String?> qKonwTag,
  i0.Value<String?> qZone,
  i0.Value<String?> qContent,
  i0.Value<String?> qImg1,
  i0.Value<String?> qImg2,
  i0.Value<String?> qOpt,
  i0.Value<String?> qAnswer,
  i0.Value<String?> qPoint,
  required int qQuicklyRem,
  i0.Value<int?> qSkills,
  i0.Value<int?> qAnswerDetail,
  i0.Value<int> qAnswerStatus,
  i0.Value<int?> qChangeDate,
  i0.Value<int?> qCollectionStatus,
  i0.Value<int?> qDoneStatus,
  i0.Value<int?> isVisible,
  i0.Value<int> sort,
});
typedef $ExamUpdateCompanionBuilder = i1.ExamCompanion Function({
  i0.Value<int> id,
  i0.Value<String?> character,
  i0.Value<int> qType,
  i0.Value<String?> qTypeTag,
  i0.Value<String?> qDetailTag,
  i0.Value<String?> qKonwTag,
  i0.Value<String?> qZone,
  i0.Value<String?> qContent,
  i0.Value<String?> qImg1,
  i0.Value<String?> qImg2,
  i0.Value<String?> qOpt,
  i0.Value<String?> qAnswer,
  i0.Value<String?> qPoint,
  i0.Value<int> qQuicklyRem,
  i0.Value<int?> qSkills,
  i0.Value<int?> qAnswerDetail,
  i0.Value<int> qAnswerStatus,
  i0.Value<int?> qChangeDate,
  i0.Value<int?> qCollectionStatus,
  i0.Value<int?> qDoneStatus,
  i0.Value<int?> isVisible,
  i0.Value<int> sort,
});

class $ExamFilterComposer extends i0.Composer<i0.GeneratedDatabase, i1.Exam> {
  $ExamFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get character => $composableBuilder(
      column: $table.character, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qType => $composableBuilder(
      column: $table.qType, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qTypeTag => $composableBuilder(
      column: $table.qTypeTag, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qDetailTag => $composableBuilder(
      column: $table.qDetailTag, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qKonwTag => $composableBuilder(
      column: $table.qKonwTag, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qZone => $composableBuilder(
      column: $table.qZone, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qContent => $composableBuilder(
      column: $table.qContent, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qImg1 => $composableBuilder(
      column: $table.qImg1, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qImg2 => $composableBuilder(
      column: $table.qImg2, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qOpt => $composableBuilder(
      column: $table.qOpt, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qAnswer => $composableBuilder(
      column: $table.qAnswer, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qPoint => $composableBuilder(
      column: $table.qPoint, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qQuicklyRem => $composableBuilder(
      column: $table.qQuicklyRem,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qSkills => $composableBuilder(
      column: $table.qSkills, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qAnswerDetail => $composableBuilder(
      column: $table.qAnswerDetail,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qAnswerStatus => $composableBuilder(
      column: $table.qAnswerStatus,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qChangeDate => $composableBuilder(
      column: $table.qChangeDate,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qCollectionStatus => $composableBuilder(
      column: $table.qCollectionStatus,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qDoneStatus => $composableBuilder(
      column: $table.qDoneStatus,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get isVisible => $composableBuilder(
      column: $table.isVisible, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => i0.ColumnFilters(column));
}

class $ExamOrderingComposer extends i0.Composer<i0.GeneratedDatabase, i1.Exam> {
  $ExamOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get character => $composableBuilder(
      column: $table.character,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qType => $composableBuilder(
      column: $table.qType, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qTypeTag => $composableBuilder(
      column: $table.qTypeTag, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qDetailTag => $composableBuilder(
      column: $table.qDetailTag,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qKonwTag => $composableBuilder(
      column: $table.qKonwTag, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qZone => $composableBuilder(
      column: $table.qZone, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qContent => $composableBuilder(
      column: $table.qContent, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qImg1 => $composableBuilder(
      column: $table.qImg1, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qImg2 => $composableBuilder(
      column: $table.qImg2, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qOpt => $composableBuilder(
      column: $table.qOpt, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qAnswer => $composableBuilder(
      column: $table.qAnswer, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qPoint => $composableBuilder(
      column: $table.qPoint, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qQuicklyRem => $composableBuilder(
      column: $table.qQuicklyRem,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qSkills => $composableBuilder(
      column: $table.qSkills, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qAnswerDetail => $composableBuilder(
      column: $table.qAnswerDetail,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qAnswerStatus => $composableBuilder(
      column: $table.qAnswerStatus,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qChangeDate => $composableBuilder(
      column: $table.qChangeDate,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qCollectionStatus => $composableBuilder(
      column: $table.qCollectionStatus,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qDoneStatus => $composableBuilder(
      column: $table.qDoneStatus,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get isVisible => $composableBuilder(
      column: $table.isVisible,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => i0.ColumnOrderings(column));
}

class $ExamAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Exam> {
  $ExamAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get character =>
      $composableBuilder(column: $table.character, builder: (column) => column);

  i0.GeneratedColumn<int> get qType =>
      $composableBuilder(column: $table.qType, builder: (column) => column);

  i0.GeneratedColumn<String> get qTypeTag =>
      $composableBuilder(column: $table.qTypeTag, builder: (column) => column);

  i0.GeneratedColumn<String> get qDetailTag => $composableBuilder(
      column: $table.qDetailTag, builder: (column) => column);

  i0.GeneratedColumn<String> get qKonwTag =>
      $composableBuilder(column: $table.qKonwTag, builder: (column) => column);

  i0.GeneratedColumn<String> get qZone =>
      $composableBuilder(column: $table.qZone, builder: (column) => column);

  i0.GeneratedColumn<String> get qContent =>
      $composableBuilder(column: $table.qContent, builder: (column) => column);

  i0.GeneratedColumn<String> get qImg1 =>
      $composableBuilder(column: $table.qImg1, builder: (column) => column);

  i0.GeneratedColumn<String> get qImg2 =>
      $composableBuilder(column: $table.qImg2, builder: (column) => column);

  i0.GeneratedColumn<String> get qOpt =>
      $composableBuilder(column: $table.qOpt, builder: (column) => column);

  i0.GeneratedColumn<String> get qAnswer =>
      $composableBuilder(column: $table.qAnswer, builder: (column) => column);

  i0.GeneratedColumn<String> get qPoint =>
      $composableBuilder(column: $table.qPoint, builder: (column) => column);

  i0.GeneratedColumn<int> get qQuicklyRem => $composableBuilder(
      column: $table.qQuicklyRem, builder: (column) => column);

  i0.GeneratedColumn<int> get qSkills =>
      $composableBuilder(column: $table.qSkills, builder: (column) => column);

  i0.GeneratedColumn<int> get qAnswerDetail => $composableBuilder(
      column: $table.qAnswerDetail, builder: (column) => column);

  i0.GeneratedColumn<int> get qAnswerStatus => $composableBuilder(
      column: $table.qAnswerStatus, builder: (column) => column);

  i0.GeneratedColumn<int> get qChangeDate => $composableBuilder(
      column: $table.qChangeDate, builder: (column) => column);

  i0.GeneratedColumn<int> get qCollectionStatus => $composableBuilder(
      column: $table.qCollectionStatus, builder: (column) => column);

  i0.GeneratedColumn<int> get qDoneStatus => $composableBuilder(
      column: $table.qDoneStatus, builder: (column) => column);

  i0.GeneratedColumn<int> get isVisible =>
      $composableBuilder(column: $table.isVisible, builder: (column) => column);

  i0.GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);
}

class $ExamTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.Exam,
    i1.ExamData,
    i1.$ExamFilterComposer,
    i1.$ExamOrderingComposer,
    i1.$ExamAnnotationComposer,
    $ExamCreateCompanionBuilder,
    $ExamUpdateCompanionBuilder,
    (
      i1.ExamData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.Exam, i1.ExamData>
    ),
    i1.ExamData,
    i0.PrefetchHooks Function()> {
  $ExamTableManager(i0.GeneratedDatabase db, i1.Exam table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$ExamFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$ExamOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$ExamAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String?> character = const i0.Value.absent(),
            i0.Value<int> qType = const i0.Value.absent(),
            i0.Value<String?> qTypeTag = const i0.Value.absent(),
            i0.Value<String?> qDetailTag = const i0.Value.absent(),
            i0.Value<String?> qKonwTag = const i0.Value.absent(),
            i0.Value<String?> qZone = const i0.Value.absent(),
            i0.Value<String?> qContent = const i0.Value.absent(),
            i0.Value<String?> qImg1 = const i0.Value.absent(),
            i0.Value<String?> qImg2 = const i0.Value.absent(),
            i0.Value<String?> qOpt = const i0.Value.absent(),
            i0.Value<String?> qAnswer = const i0.Value.absent(),
            i0.Value<String?> qPoint = const i0.Value.absent(),
            i0.Value<int> qQuicklyRem = const i0.Value.absent(),
            i0.Value<int?> qSkills = const i0.Value.absent(),
            i0.Value<int?> qAnswerDetail = const i0.Value.absent(),
            i0.Value<int> qAnswerStatus = const i0.Value.absent(),
            i0.Value<int?> qChangeDate = const i0.Value.absent(),
            i0.Value<int?> qCollectionStatus = const i0.Value.absent(),
            i0.Value<int?> qDoneStatus = const i0.Value.absent(),
            i0.Value<int?> isVisible = const i0.Value.absent(),
            i0.Value<int> sort = const i0.Value.absent(),
          }) =>
              i1.ExamCompanion(
            id: id,
            character: character,
            qType: qType,
            qTypeTag: qTypeTag,
            qDetailTag: qDetailTag,
            qKonwTag: qKonwTag,
            qZone: qZone,
            qContent: qContent,
            qImg1: qImg1,
            qImg2: qImg2,
            qOpt: qOpt,
            qAnswer: qAnswer,
            qPoint: qPoint,
            qQuicklyRem: qQuicklyRem,
            qSkills: qSkills,
            qAnswerDetail: qAnswerDetail,
            qAnswerStatus: qAnswerStatus,
            qChangeDate: qChangeDate,
            qCollectionStatus: qCollectionStatus,
            qDoneStatus: qDoneStatus,
            isVisible: isVisible,
            sort: sort,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String?> character = const i0.Value.absent(),
            required int qType,
            i0.Value<String?> qTypeTag = const i0.Value.absent(),
            i0.Value<String?> qDetailTag = const i0.Value.absent(),
            i0.Value<String?> qKonwTag = const i0.Value.absent(),
            i0.Value<String?> qZone = const i0.Value.absent(),
            i0.Value<String?> qContent = const i0.Value.absent(),
            i0.Value<String?> qImg1 = const i0.Value.absent(),
            i0.Value<String?> qImg2 = const i0.Value.absent(),
            i0.Value<String?> qOpt = const i0.Value.absent(),
            i0.Value<String?> qAnswer = const i0.Value.absent(),
            i0.Value<String?> qPoint = const i0.Value.absent(),
            required int qQuicklyRem,
            i0.Value<int?> qSkills = const i0.Value.absent(),
            i0.Value<int?> qAnswerDetail = const i0.Value.absent(),
            i0.Value<int> qAnswerStatus = const i0.Value.absent(),
            i0.Value<int?> qChangeDate = const i0.Value.absent(),
            i0.Value<int?> qCollectionStatus = const i0.Value.absent(),
            i0.Value<int?> qDoneStatus = const i0.Value.absent(),
            i0.Value<int?> isVisible = const i0.Value.absent(),
            i0.Value<int> sort = const i0.Value.absent(),
          }) =>
              i1.ExamCompanion.insert(
            id: id,
            character: character,
            qType: qType,
            qTypeTag: qTypeTag,
            qDetailTag: qDetailTag,
            qKonwTag: qKonwTag,
            qZone: qZone,
            qContent: qContent,
            qImg1: qImg1,
            qImg2: qImg2,
            qOpt: qOpt,
            qAnswer: qAnswer,
            qPoint: qPoint,
            qQuicklyRem: qQuicklyRem,
            qSkills: qSkills,
            qAnswerDetail: qAnswerDetail,
            qAnswerStatus: qAnswerStatus,
            qChangeDate: qChangeDate,
            qCollectionStatus: qCollectionStatus,
            qDoneStatus: qDoneStatus,
            isVisible: isVisible,
            sort: sort,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $ExamProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.Exam,
    i1.ExamData,
    i1.$ExamFilterComposer,
    i1.$ExamOrderingComposer,
    i1.$ExamAnnotationComposer,
    $ExamCreateCompanionBuilder,
    $ExamUpdateCompanionBuilder,
    (
      i1.ExamData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.Exam, i1.ExamData>
    ),
    i1.ExamData,
    i0.PrefetchHooks Function()>;
typedef $Exam500CreateCompanionBuilder = i1.Exam500Companion Function({
  i0.Value<int> id,
  i0.Value<String?> character,
  required int qType,
  i0.Value<String?> qTypeTag,
  i0.Value<String?> qDetailTag,
  i0.Value<String?> qKonwTag,
  i0.Value<String?> qZone,
  i0.Value<String?> qContent,
  i0.Value<String?> qImg1,
  i0.Value<String?> qImg2,
  i0.Value<String?> qOpt,
  i0.Value<String?> qAnswer,
  i0.Value<String?> qPoint,
  required int qQuicklyRem,
  i0.Value<int?> qSkills,
  i0.Value<int?> qAnswerDetail,
  i0.Value<int> qAnswerStatus,
  i0.Value<int?> qCollectionStatus,
  i0.Value<int?> step,
  i0.Value<int> sort,
});
typedef $Exam500UpdateCompanionBuilder = i1.Exam500Companion Function({
  i0.Value<int> id,
  i0.Value<String?> character,
  i0.Value<int> qType,
  i0.Value<String?> qTypeTag,
  i0.Value<String?> qDetailTag,
  i0.Value<String?> qKonwTag,
  i0.Value<String?> qZone,
  i0.Value<String?> qContent,
  i0.Value<String?> qImg1,
  i0.Value<String?> qImg2,
  i0.Value<String?> qOpt,
  i0.Value<String?> qAnswer,
  i0.Value<String?> qPoint,
  i0.Value<int> qQuicklyRem,
  i0.Value<int?> qSkills,
  i0.Value<int?> qAnswerDetail,
  i0.Value<int> qAnswerStatus,
  i0.Value<int?> qCollectionStatus,
  i0.Value<int?> step,
  i0.Value<int> sort,
});

class $Exam500FilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Exam500> {
  $Exam500FilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get character => $composableBuilder(
      column: $table.character, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qType => $composableBuilder(
      column: $table.qType, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qTypeTag => $composableBuilder(
      column: $table.qTypeTag, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qDetailTag => $composableBuilder(
      column: $table.qDetailTag, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qKonwTag => $composableBuilder(
      column: $table.qKonwTag, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qZone => $composableBuilder(
      column: $table.qZone, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qContent => $composableBuilder(
      column: $table.qContent, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qImg1 => $composableBuilder(
      column: $table.qImg1, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qImg2 => $composableBuilder(
      column: $table.qImg2, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qOpt => $composableBuilder(
      column: $table.qOpt, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qAnswer => $composableBuilder(
      column: $table.qAnswer, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get qPoint => $composableBuilder(
      column: $table.qPoint, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qQuicklyRem => $composableBuilder(
      column: $table.qQuicklyRem,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qSkills => $composableBuilder(
      column: $table.qSkills, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qAnswerDetail => $composableBuilder(
      column: $table.qAnswerDetail,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qAnswerStatus => $composableBuilder(
      column: $table.qAnswerStatus,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get qCollectionStatus => $composableBuilder(
      column: $table.qCollectionStatus,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get step => $composableBuilder(
      column: $table.step, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => i0.ColumnFilters(column));
}

class $Exam500OrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Exam500> {
  $Exam500OrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get character => $composableBuilder(
      column: $table.character,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qType => $composableBuilder(
      column: $table.qType, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qTypeTag => $composableBuilder(
      column: $table.qTypeTag, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qDetailTag => $composableBuilder(
      column: $table.qDetailTag,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qKonwTag => $composableBuilder(
      column: $table.qKonwTag, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qZone => $composableBuilder(
      column: $table.qZone, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qContent => $composableBuilder(
      column: $table.qContent, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qImg1 => $composableBuilder(
      column: $table.qImg1, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qImg2 => $composableBuilder(
      column: $table.qImg2, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qOpt => $composableBuilder(
      column: $table.qOpt, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qAnswer => $composableBuilder(
      column: $table.qAnswer, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get qPoint => $composableBuilder(
      column: $table.qPoint, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qQuicklyRem => $composableBuilder(
      column: $table.qQuicklyRem,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qSkills => $composableBuilder(
      column: $table.qSkills, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qAnswerDetail => $composableBuilder(
      column: $table.qAnswerDetail,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qAnswerStatus => $composableBuilder(
      column: $table.qAnswerStatus,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get qCollectionStatus => $composableBuilder(
      column: $table.qCollectionStatus,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get step => $composableBuilder(
      column: $table.step, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => i0.ColumnOrderings(column));
}

class $Exam500AnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Exam500> {
  $Exam500AnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get character =>
      $composableBuilder(column: $table.character, builder: (column) => column);

  i0.GeneratedColumn<int> get qType =>
      $composableBuilder(column: $table.qType, builder: (column) => column);

  i0.GeneratedColumn<String> get qTypeTag =>
      $composableBuilder(column: $table.qTypeTag, builder: (column) => column);

  i0.GeneratedColumn<String> get qDetailTag => $composableBuilder(
      column: $table.qDetailTag, builder: (column) => column);

  i0.GeneratedColumn<String> get qKonwTag =>
      $composableBuilder(column: $table.qKonwTag, builder: (column) => column);

  i0.GeneratedColumn<String> get qZone =>
      $composableBuilder(column: $table.qZone, builder: (column) => column);

  i0.GeneratedColumn<String> get qContent =>
      $composableBuilder(column: $table.qContent, builder: (column) => column);

  i0.GeneratedColumn<String> get qImg1 =>
      $composableBuilder(column: $table.qImg1, builder: (column) => column);

  i0.GeneratedColumn<String> get qImg2 =>
      $composableBuilder(column: $table.qImg2, builder: (column) => column);

  i0.GeneratedColumn<String> get qOpt =>
      $composableBuilder(column: $table.qOpt, builder: (column) => column);

  i0.GeneratedColumn<String> get qAnswer =>
      $composableBuilder(column: $table.qAnswer, builder: (column) => column);

  i0.GeneratedColumn<String> get qPoint =>
      $composableBuilder(column: $table.qPoint, builder: (column) => column);

  i0.GeneratedColumn<int> get qQuicklyRem => $composableBuilder(
      column: $table.qQuicklyRem, builder: (column) => column);

  i0.GeneratedColumn<int> get qSkills =>
      $composableBuilder(column: $table.qSkills, builder: (column) => column);

  i0.GeneratedColumn<int> get qAnswerDetail => $composableBuilder(
      column: $table.qAnswerDetail, builder: (column) => column);

  i0.GeneratedColumn<int> get qAnswerStatus => $composableBuilder(
      column: $table.qAnswerStatus, builder: (column) => column);

  i0.GeneratedColumn<int> get qCollectionStatus => $composableBuilder(
      column: $table.qCollectionStatus, builder: (column) => column);

  i0.GeneratedColumn<int> get step =>
      $composableBuilder(column: $table.step, builder: (column) => column);

  i0.GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);
}

class $Exam500TableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.Exam500,
    i1.Exam500Data,
    i1.$Exam500FilterComposer,
    i1.$Exam500OrderingComposer,
    i1.$Exam500AnnotationComposer,
    $Exam500CreateCompanionBuilder,
    $Exam500UpdateCompanionBuilder,
    (
      i1.Exam500Data,
      i0.BaseReferences<i0.GeneratedDatabase, i1.Exam500, i1.Exam500Data>
    ),
    i1.Exam500Data,
    i0.PrefetchHooks Function()> {
  $Exam500TableManager(i0.GeneratedDatabase db, i1.Exam500 table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$Exam500FilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$Exam500OrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$Exam500AnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String?> character = const i0.Value.absent(),
            i0.Value<int> qType = const i0.Value.absent(),
            i0.Value<String?> qTypeTag = const i0.Value.absent(),
            i0.Value<String?> qDetailTag = const i0.Value.absent(),
            i0.Value<String?> qKonwTag = const i0.Value.absent(),
            i0.Value<String?> qZone = const i0.Value.absent(),
            i0.Value<String?> qContent = const i0.Value.absent(),
            i0.Value<String?> qImg1 = const i0.Value.absent(),
            i0.Value<String?> qImg2 = const i0.Value.absent(),
            i0.Value<String?> qOpt = const i0.Value.absent(),
            i0.Value<String?> qAnswer = const i0.Value.absent(),
            i0.Value<String?> qPoint = const i0.Value.absent(),
            i0.Value<int> qQuicklyRem = const i0.Value.absent(),
            i0.Value<int?> qSkills = const i0.Value.absent(),
            i0.Value<int?> qAnswerDetail = const i0.Value.absent(),
            i0.Value<int> qAnswerStatus = const i0.Value.absent(),
            i0.Value<int?> qCollectionStatus = const i0.Value.absent(),
            i0.Value<int?> step = const i0.Value.absent(),
            i0.Value<int> sort = const i0.Value.absent(),
          }) =>
              i1.Exam500Companion(
            id: id,
            character: character,
            qType: qType,
            qTypeTag: qTypeTag,
            qDetailTag: qDetailTag,
            qKonwTag: qKonwTag,
            qZone: qZone,
            qContent: qContent,
            qImg1: qImg1,
            qImg2: qImg2,
            qOpt: qOpt,
            qAnswer: qAnswer,
            qPoint: qPoint,
            qQuicklyRem: qQuicklyRem,
            qSkills: qSkills,
            qAnswerDetail: qAnswerDetail,
            qAnswerStatus: qAnswerStatus,
            qCollectionStatus: qCollectionStatus,
            step: step,
            sort: sort,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String?> character = const i0.Value.absent(),
            required int qType,
            i0.Value<String?> qTypeTag = const i0.Value.absent(),
            i0.Value<String?> qDetailTag = const i0.Value.absent(),
            i0.Value<String?> qKonwTag = const i0.Value.absent(),
            i0.Value<String?> qZone = const i0.Value.absent(),
            i0.Value<String?> qContent = const i0.Value.absent(),
            i0.Value<String?> qImg1 = const i0.Value.absent(),
            i0.Value<String?> qImg2 = const i0.Value.absent(),
            i0.Value<String?> qOpt = const i0.Value.absent(),
            i0.Value<String?> qAnswer = const i0.Value.absent(),
            i0.Value<String?> qPoint = const i0.Value.absent(),
            required int qQuicklyRem,
            i0.Value<int?> qSkills = const i0.Value.absent(),
            i0.Value<int?> qAnswerDetail = const i0.Value.absent(),
            i0.Value<int> qAnswerStatus = const i0.Value.absent(),
            i0.Value<int?> qCollectionStatus = const i0.Value.absent(),
            i0.Value<int?> step = const i0.Value.absent(),
            i0.Value<int> sort = const i0.Value.absent(),
          }) =>
              i1.Exam500Companion.insert(
            id: id,
            character: character,
            qType: qType,
            qTypeTag: qTypeTag,
            qDetailTag: qDetailTag,
            qKonwTag: qKonwTag,
            qZone: qZone,
            qContent: qContent,
            qImg1: qImg1,
            qImg2: qImg2,
            qOpt: qOpt,
            qAnswer: qAnswer,
            qPoint: qPoint,
            qQuicklyRem: qQuicklyRem,
            qSkills: qSkills,
            qAnswerDetail: qAnswerDetail,
            qAnswerStatus: qAnswerStatus,
            qCollectionStatus: qCollectionStatus,
            step: step,
            sort: sort,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $Exam500ProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.Exam500,
    i1.Exam500Data,
    i1.$Exam500FilterComposer,
    i1.$Exam500OrderingComposer,
    i1.$Exam500AnnotationComposer,
    $Exam500CreateCompanionBuilder,
    $Exam500UpdateCompanionBuilder,
    (
      i1.Exam500Data,
      i0.BaseReferences<i0.GeneratedDatabase, i1.Exam500, i1.Exam500Data>
    ),
    i1.Exam500Data,
    i0.PrefetchHooks Function()>;

class Exam extends i0.Table with i0.TableInfo<Exam, i1.ExamData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Exam(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const i0.VerificationMeta _characterMeta =
      const i0.VerificationMeta('character');
  late final i0.GeneratedColumn<String> character = i0.GeneratedColumn<String>(
      'character', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qTypeMeta =
      const i0.VerificationMeta('qType');
  late final i0.GeneratedColumn<int> qType = i0.GeneratedColumn<int>(
      'q_type', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _qTypeTagMeta =
      const i0.VerificationMeta('qTypeTag');
  late final i0.GeneratedColumn<String> qTypeTag = i0.GeneratedColumn<String>(
      'q_type_tag', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qDetailTagMeta =
      const i0.VerificationMeta('qDetailTag');
  late final i0.GeneratedColumn<String> qDetailTag = i0.GeneratedColumn<String>(
      'q_detail_tag', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qKonwTagMeta =
      const i0.VerificationMeta('qKonwTag');
  late final i0.GeneratedColumn<String> qKonwTag = i0.GeneratedColumn<String>(
      'q_konw_tag', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qZoneMeta =
      const i0.VerificationMeta('qZone');
  late final i0.GeneratedColumn<String> qZone = i0.GeneratedColumn<String>(
      'q_zone', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qContentMeta =
      const i0.VerificationMeta('qContent');
  late final i0.GeneratedColumn<String> qContent = i0.GeneratedColumn<String>(
      'q_content', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qImg1Meta =
      const i0.VerificationMeta('qImg1');
  late final i0.GeneratedColumn<String> qImg1 = i0.GeneratedColumn<String>(
      'q_img1', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qImg2Meta =
      const i0.VerificationMeta('qImg2');
  late final i0.GeneratedColumn<String> qImg2 = i0.GeneratedColumn<String>(
      'q_img2', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qOptMeta =
      const i0.VerificationMeta('qOpt');
  late final i0.GeneratedColumn<String> qOpt = i0.GeneratedColumn<String>(
      'q_opt', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qAnswerMeta =
      const i0.VerificationMeta('qAnswer');
  late final i0.GeneratedColumn<String> qAnswer = i0.GeneratedColumn<String>(
      'q_answer', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qPointMeta =
      const i0.VerificationMeta('qPoint');
  late final i0.GeneratedColumn<String> qPoint = i0.GeneratedColumn<String>(
      'q_point', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qQuicklyRemMeta =
      const i0.VerificationMeta('qQuicklyRem');
  late final i0.GeneratedColumn<int> qQuicklyRem = i0.GeneratedColumn<int>(
      'q_quickly_rem', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _qSkillsMeta =
      const i0.VerificationMeta('qSkills');
  late final i0.GeneratedColumn<int> qSkills = i0.GeneratedColumn<int>(
      'q_skills', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qAnswerDetailMeta =
      const i0.VerificationMeta('qAnswerDetail');
  late final i0.GeneratedColumn<int> qAnswerDetail = i0.GeneratedColumn<int>(
      'q_answer_detail', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qAnswerStatusMeta =
      const i0.VerificationMeta('qAnswerStatus');
  late final i0.GeneratedColumn<int> qAnswerStatus = i0.GeneratedColumn<int>(
      'q_answer_status', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const i0.CustomExpression('1'));
  static const i0.VerificationMeta _qChangeDateMeta =
      const i0.VerificationMeta('qChangeDate');
  late final i0.GeneratedColumn<int> qChangeDate = i0.GeneratedColumn<int>(
      'q_change_date', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qCollectionStatusMeta =
      const i0.VerificationMeta('qCollectionStatus');
  late final i0.GeneratedColumn<int> qCollectionStatus =
      i0.GeneratedColumn<int>('q_collection_status', aliasedName, true,
          type: i0.DriftSqlType.int,
          requiredDuringInsert: false,
          $customConstraints: 'DEFAULT 0',
          defaultValue: const i0.CustomExpression('0'));
  static const i0.VerificationMeta _qDoneStatusMeta =
      const i0.VerificationMeta('qDoneStatus');
  late final i0.GeneratedColumn<int> qDoneStatus = i0.GeneratedColumn<int>(
      'q_done_status', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT 1',
      defaultValue: const i0.CustomExpression('1'));
  static const i0.VerificationMeta _isVisibleMeta =
      const i0.VerificationMeta('isVisible');
  late final i0.GeneratedColumn<int> isVisible = i0.GeneratedColumn<int>(
      'is_visible', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT 1',
      defaultValue: const i0.CustomExpression('1'));
  static const i0.VerificationMeta _sortMeta =
      const i0.VerificationMeta('sort');
  late final i0.GeneratedColumn<int> sort = i0.GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const i0.CustomExpression('0'));
  @override
  List<i0.GeneratedColumn> get $columns => [
        id,
        character,
        qType,
        qTypeTag,
        qDetailTag,
        qKonwTag,
        qZone,
        qContent,
        qImg1,
        qImg2,
        qOpt,
        qAnswer,
        qPoint,
        qQuicklyRem,
        qSkills,
        qAnswerDetail,
        qAnswerStatus,
        qChangeDate,
        qCollectionStatus,
        qDoneStatus,
        isVisible,
        sort
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.ExamData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character')) {
      context.handle(_characterMeta,
          character.isAcceptableOrUnknown(data['character']!, _characterMeta));
    }
    if (data.containsKey('q_type')) {
      context.handle(
          _qTypeMeta, qType.isAcceptableOrUnknown(data['q_type']!, _qTypeMeta));
    } else if (isInserting) {
      context.missing(_qTypeMeta);
    }
    if (data.containsKey('q_type_tag')) {
      context.handle(_qTypeTagMeta,
          qTypeTag.isAcceptableOrUnknown(data['q_type_tag']!, _qTypeTagMeta));
    }
    if (data.containsKey('q_detail_tag')) {
      context.handle(
          _qDetailTagMeta,
          qDetailTag.isAcceptableOrUnknown(
              data['q_detail_tag']!, _qDetailTagMeta));
    }
    if (data.containsKey('q_konw_tag')) {
      context.handle(_qKonwTagMeta,
          qKonwTag.isAcceptableOrUnknown(data['q_konw_tag']!, _qKonwTagMeta));
    }
    if (data.containsKey('q_zone')) {
      context.handle(
          _qZoneMeta, qZone.isAcceptableOrUnknown(data['q_zone']!, _qZoneMeta));
    }
    if (data.containsKey('q_content')) {
      context.handle(_qContentMeta,
          qContent.isAcceptableOrUnknown(data['q_content']!, _qContentMeta));
    }
    if (data.containsKey('q_img1')) {
      context.handle(
          _qImg1Meta, qImg1.isAcceptableOrUnknown(data['q_img1']!, _qImg1Meta));
    }
    if (data.containsKey('q_img2')) {
      context.handle(
          _qImg2Meta, qImg2.isAcceptableOrUnknown(data['q_img2']!, _qImg2Meta));
    }
    if (data.containsKey('q_opt')) {
      context.handle(
          _qOptMeta, qOpt.isAcceptableOrUnknown(data['q_opt']!, _qOptMeta));
    }
    if (data.containsKey('q_answer')) {
      context.handle(_qAnswerMeta,
          qAnswer.isAcceptableOrUnknown(data['q_answer']!, _qAnswerMeta));
    }
    if (data.containsKey('q_point')) {
      context.handle(_qPointMeta,
          qPoint.isAcceptableOrUnknown(data['q_point']!, _qPointMeta));
    }
    if (data.containsKey('q_quickly_rem')) {
      context.handle(
          _qQuicklyRemMeta,
          qQuicklyRem.isAcceptableOrUnknown(
              data['q_quickly_rem']!, _qQuicklyRemMeta));
    } else if (isInserting) {
      context.missing(_qQuicklyRemMeta);
    }
    if (data.containsKey('q_skills')) {
      context.handle(_qSkillsMeta,
          qSkills.isAcceptableOrUnknown(data['q_skills']!, _qSkillsMeta));
    }
    if (data.containsKey('q_answer_detail')) {
      context.handle(
          _qAnswerDetailMeta,
          qAnswerDetail.isAcceptableOrUnknown(
              data['q_answer_detail']!, _qAnswerDetailMeta));
    }
    if (data.containsKey('q_answer_status')) {
      context.handle(
          _qAnswerStatusMeta,
          qAnswerStatus.isAcceptableOrUnknown(
              data['q_answer_status']!, _qAnswerStatusMeta));
    }
    if (data.containsKey('q_change_date')) {
      context.handle(
          _qChangeDateMeta,
          qChangeDate.isAcceptableOrUnknown(
              data['q_change_date']!, _qChangeDateMeta));
    }
    if (data.containsKey('q_collection_status')) {
      context.handle(
          _qCollectionStatusMeta,
          qCollectionStatus.isAcceptableOrUnknown(
              data['q_collection_status']!, _qCollectionStatusMeta));
    }
    if (data.containsKey('q_done_status')) {
      context.handle(
          _qDoneStatusMeta,
          qDoneStatus.isAcceptableOrUnknown(
              data['q_done_status']!, _qDoneStatusMeta));
    }
    if (data.containsKey('is_visible')) {
      context.handle(_isVisibleMeta,
          isVisible.isAcceptableOrUnknown(data['is_visible']!, _isVisibleMeta));
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.ExamData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ExamData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      character: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}character']),
      qType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_type'])!,
      qTypeTag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_type_tag']),
      qDetailTag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_detail_tag']),
      qKonwTag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_konw_tag']),
      qZone: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_zone']),
      qContent: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_content']),
      qImg1: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_img1']),
      qImg2: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_img2']),
      qOpt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_opt']),
      qAnswer: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_answer']),
      qPoint: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_point']),
      qQuicklyRem: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_quickly_rem'])!,
      qSkills: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_skills']),
      qAnswerDetail: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_answer_detail']),
      qAnswerStatus: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}q_answer_status'])!,
      qChangeDate: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_change_date']),
      qCollectionStatus: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}q_collection_status']),
      qDoneStatus: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_done_status']),
      isVisible: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}is_visible']),
      sort: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}sort'])!,
    );
  }

  @override
  Exam createAlias(String alias) {
    return Exam(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ExamData extends i0.DataClass implements i0.Insertable<i1.ExamData> {
  final int id;
  final String? character;
  final int qType;
  final String? qTypeTag;
  final String? qDetailTag;
  final String? qKonwTag;
  final String? qZone;
  final String? qContent;
  final String? qImg1;
  final String? qImg2;
  final String? qOpt;
  final String? qAnswer;
  final String? qPoint;
  final int qQuicklyRem;
  final int? qSkills;
  final int? qAnswerDetail;
  final int qAnswerStatus;
  final int? qChangeDate;
  final int? qCollectionStatus;
  final int? qDoneStatus;
  final int? isVisible;
  final int sort;
  const ExamData(
      {required this.id,
      this.character,
      required this.qType,
      this.qTypeTag,
      this.qDetailTag,
      this.qKonwTag,
      this.qZone,
      this.qContent,
      this.qImg1,
      this.qImg2,
      this.qOpt,
      this.qAnswer,
      this.qPoint,
      required this.qQuicklyRem,
      this.qSkills,
      this.qAnswerDetail,
      required this.qAnswerStatus,
      this.qChangeDate,
      this.qCollectionStatus,
      this.qDoneStatus,
      this.isVisible,
      required this.sort});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    if (!nullToAbsent || character != null) {
      map['character'] = i0.Variable<String>(character);
    }
    map['q_type'] = i0.Variable<int>(qType);
    if (!nullToAbsent || qTypeTag != null) {
      map['q_type_tag'] = i0.Variable<String>(qTypeTag);
    }
    if (!nullToAbsent || qDetailTag != null) {
      map['q_detail_tag'] = i0.Variable<String>(qDetailTag);
    }
    if (!nullToAbsent || qKonwTag != null) {
      map['q_konw_tag'] = i0.Variable<String>(qKonwTag);
    }
    if (!nullToAbsent || qZone != null) {
      map['q_zone'] = i0.Variable<String>(qZone);
    }
    if (!nullToAbsent || qContent != null) {
      map['q_content'] = i0.Variable<String>(qContent);
    }
    if (!nullToAbsent || qImg1 != null) {
      map['q_img1'] = i0.Variable<String>(qImg1);
    }
    if (!nullToAbsent || qImg2 != null) {
      map['q_img2'] = i0.Variable<String>(qImg2);
    }
    if (!nullToAbsent || qOpt != null) {
      map['q_opt'] = i0.Variable<String>(qOpt);
    }
    if (!nullToAbsent || qAnswer != null) {
      map['q_answer'] = i0.Variable<String>(qAnswer);
    }
    if (!nullToAbsent || qPoint != null) {
      map['q_point'] = i0.Variable<String>(qPoint);
    }
    map['q_quickly_rem'] = i0.Variable<int>(qQuicklyRem);
    if (!nullToAbsent || qSkills != null) {
      map['q_skills'] = i0.Variable<int>(qSkills);
    }
    if (!nullToAbsent || qAnswerDetail != null) {
      map['q_answer_detail'] = i0.Variable<int>(qAnswerDetail);
    }
    map['q_answer_status'] = i0.Variable<int>(qAnswerStatus);
    if (!nullToAbsent || qChangeDate != null) {
      map['q_change_date'] = i0.Variable<int>(qChangeDate);
    }
    if (!nullToAbsent || qCollectionStatus != null) {
      map['q_collection_status'] = i0.Variable<int>(qCollectionStatus);
    }
    if (!nullToAbsent || qDoneStatus != null) {
      map['q_done_status'] = i0.Variable<int>(qDoneStatus);
    }
    if (!nullToAbsent || isVisible != null) {
      map['is_visible'] = i0.Variable<int>(isVisible);
    }
    map['sort'] = i0.Variable<int>(sort);
    return map;
  }

  i1.ExamCompanion toCompanion(bool nullToAbsent) {
    return i1.ExamCompanion(
      id: i0.Value(id),
      character: character == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(character),
      qType: i0.Value(qType),
      qTypeTag: qTypeTag == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qTypeTag),
      qDetailTag: qDetailTag == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qDetailTag),
      qKonwTag: qKonwTag == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qKonwTag),
      qZone: qZone == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qZone),
      qContent: qContent == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qContent),
      qImg1: qImg1 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qImg1),
      qImg2: qImg2 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qImg2),
      qOpt: qOpt == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qOpt),
      qAnswer: qAnswer == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qAnswer),
      qPoint: qPoint == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qPoint),
      qQuicklyRem: i0.Value(qQuicklyRem),
      qSkills: qSkills == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qSkills),
      qAnswerDetail: qAnswerDetail == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qAnswerDetail),
      qAnswerStatus: i0.Value(qAnswerStatus),
      qChangeDate: qChangeDate == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qChangeDate),
      qCollectionStatus: qCollectionStatus == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qCollectionStatus),
      qDoneStatus: qDoneStatus == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qDoneStatus),
      isVisible: isVisible == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(isVisible),
      sort: i0.Value(sort),
    );
  }

  factory ExamData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ExamData(
      id: serializer.fromJson<int>(json['id']),
      character: serializer.fromJson<String?>(json['character']),
      qType: serializer.fromJson<int>(json['q_type']),
      qTypeTag: serializer.fromJson<String?>(json['q_type_tag']),
      qDetailTag: serializer.fromJson<String?>(json['q_detail_tag']),
      qKonwTag: serializer.fromJson<String?>(json['q_konw_tag']),
      qZone: serializer.fromJson<String?>(json['q_zone']),
      qContent: serializer.fromJson<String?>(json['q_content']),
      qImg1: serializer.fromJson<String?>(json['q_img1']),
      qImg2: serializer.fromJson<String?>(json['q_img2']),
      qOpt: serializer.fromJson<String?>(json['q_opt']),
      qAnswer: serializer.fromJson<String?>(json['q_answer']),
      qPoint: serializer.fromJson<String?>(json['q_point']),
      qQuicklyRem: serializer.fromJson<int>(json['q_quickly_rem']),
      qSkills: serializer.fromJson<int?>(json['q_skills']),
      qAnswerDetail: serializer.fromJson<int?>(json['q_answer_detail']),
      qAnswerStatus: serializer.fromJson<int>(json['q_answer_status']),
      qChangeDate: serializer.fromJson<int?>(json['q_change_date']),
      qCollectionStatus: serializer.fromJson<int?>(json['q_collection_status']),
      qDoneStatus: serializer.fromJson<int?>(json['q_done_status']),
      isVisible: serializer.fromJson<int?>(json['is_visible']),
      sort: serializer.fromJson<int>(json['sort']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'character': serializer.toJson<String?>(character),
      'q_type': serializer.toJson<int>(qType),
      'q_type_tag': serializer.toJson<String?>(qTypeTag),
      'q_detail_tag': serializer.toJson<String?>(qDetailTag),
      'q_konw_tag': serializer.toJson<String?>(qKonwTag),
      'q_zone': serializer.toJson<String?>(qZone),
      'q_content': serializer.toJson<String?>(qContent),
      'q_img1': serializer.toJson<String?>(qImg1),
      'q_img2': serializer.toJson<String?>(qImg2),
      'q_opt': serializer.toJson<String?>(qOpt),
      'q_answer': serializer.toJson<String?>(qAnswer),
      'q_point': serializer.toJson<String?>(qPoint),
      'q_quickly_rem': serializer.toJson<int>(qQuicklyRem),
      'q_skills': serializer.toJson<int?>(qSkills),
      'q_answer_detail': serializer.toJson<int?>(qAnswerDetail),
      'q_answer_status': serializer.toJson<int>(qAnswerStatus),
      'q_change_date': serializer.toJson<int?>(qChangeDate),
      'q_collection_status': serializer.toJson<int?>(qCollectionStatus),
      'q_done_status': serializer.toJson<int?>(qDoneStatus),
      'is_visible': serializer.toJson<int?>(isVisible),
      'sort': serializer.toJson<int>(sort),
    };
  }

  i1.ExamData copyWith(
          {int? id,
          i0.Value<String?> character = const i0.Value.absent(),
          int? qType,
          i0.Value<String?> qTypeTag = const i0.Value.absent(),
          i0.Value<String?> qDetailTag = const i0.Value.absent(),
          i0.Value<String?> qKonwTag = const i0.Value.absent(),
          i0.Value<String?> qZone = const i0.Value.absent(),
          i0.Value<String?> qContent = const i0.Value.absent(),
          i0.Value<String?> qImg1 = const i0.Value.absent(),
          i0.Value<String?> qImg2 = const i0.Value.absent(),
          i0.Value<String?> qOpt = const i0.Value.absent(),
          i0.Value<String?> qAnswer = const i0.Value.absent(),
          i0.Value<String?> qPoint = const i0.Value.absent(),
          int? qQuicklyRem,
          i0.Value<int?> qSkills = const i0.Value.absent(),
          i0.Value<int?> qAnswerDetail = const i0.Value.absent(),
          int? qAnswerStatus,
          i0.Value<int?> qChangeDate = const i0.Value.absent(),
          i0.Value<int?> qCollectionStatus = const i0.Value.absent(),
          i0.Value<int?> qDoneStatus = const i0.Value.absent(),
          i0.Value<int?> isVisible = const i0.Value.absent(),
          int? sort}) =>
      i1.ExamData(
        id: id ?? this.id,
        character: character.present ? character.value : this.character,
        qType: qType ?? this.qType,
        qTypeTag: qTypeTag.present ? qTypeTag.value : this.qTypeTag,
        qDetailTag: qDetailTag.present ? qDetailTag.value : this.qDetailTag,
        qKonwTag: qKonwTag.present ? qKonwTag.value : this.qKonwTag,
        qZone: qZone.present ? qZone.value : this.qZone,
        qContent: qContent.present ? qContent.value : this.qContent,
        qImg1: qImg1.present ? qImg1.value : this.qImg1,
        qImg2: qImg2.present ? qImg2.value : this.qImg2,
        qOpt: qOpt.present ? qOpt.value : this.qOpt,
        qAnswer: qAnswer.present ? qAnswer.value : this.qAnswer,
        qPoint: qPoint.present ? qPoint.value : this.qPoint,
        qQuicklyRem: qQuicklyRem ?? this.qQuicklyRem,
        qSkills: qSkills.present ? qSkills.value : this.qSkills,
        qAnswerDetail:
            qAnswerDetail.present ? qAnswerDetail.value : this.qAnswerDetail,
        qAnswerStatus: qAnswerStatus ?? this.qAnswerStatus,
        qChangeDate: qChangeDate.present ? qChangeDate.value : this.qChangeDate,
        qCollectionStatus: qCollectionStatus.present
            ? qCollectionStatus.value
            : this.qCollectionStatus,
        qDoneStatus: qDoneStatus.present ? qDoneStatus.value : this.qDoneStatus,
        isVisible: isVisible.present ? isVisible.value : this.isVisible,
        sort: sort ?? this.sort,
      );
  ExamData copyWithCompanion(i1.ExamCompanion data) {
    return ExamData(
      id: data.id.present ? data.id.value : this.id,
      character: data.character.present ? data.character.value : this.character,
      qType: data.qType.present ? data.qType.value : this.qType,
      qTypeTag: data.qTypeTag.present ? data.qTypeTag.value : this.qTypeTag,
      qDetailTag:
          data.qDetailTag.present ? data.qDetailTag.value : this.qDetailTag,
      qKonwTag: data.qKonwTag.present ? data.qKonwTag.value : this.qKonwTag,
      qZone: data.qZone.present ? data.qZone.value : this.qZone,
      qContent: data.qContent.present ? data.qContent.value : this.qContent,
      qImg1: data.qImg1.present ? data.qImg1.value : this.qImg1,
      qImg2: data.qImg2.present ? data.qImg2.value : this.qImg2,
      qOpt: data.qOpt.present ? data.qOpt.value : this.qOpt,
      qAnswer: data.qAnswer.present ? data.qAnswer.value : this.qAnswer,
      qPoint: data.qPoint.present ? data.qPoint.value : this.qPoint,
      qQuicklyRem:
          data.qQuicklyRem.present ? data.qQuicklyRem.value : this.qQuicklyRem,
      qSkills: data.qSkills.present ? data.qSkills.value : this.qSkills,
      qAnswerDetail: data.qAnswerDetail.present
          ? data.qAnswerDetail.value
          : this.qAnswerDetail,
      qAnswerStatus: data.qAnswerStatus.present
          ? data.qAnswerStatus.value
          : this.qAnswerStatus,
      qChangeDate:
          data.qChangeDate.present ? data.qChangeDate.value : this.qChangeDate,
      qCollectionStatus: data.qCollectionStatus.present
          ? data.qCollectionStatus.value
          : this.qCollectionStatus,
      qDoneStatus:
          data.qDoneStatus.present ? data.qDoneStatus.value : this.qDoneStatus,
      isVisible: data.isVisible.present ? data.isVisible.value : this.isVisible,
      sort: data.sort.present ? data.sort.value : this.sort,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamData(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('qType: $qType, ')
          ..write('qTypeTag: $qTypeTag, ')
          ..write('qDetailTag: $qDetailTag, ')
          ..write('qKonwTag: $qKonwTag, ')
          ..write('qZone: $qZone, ')
          ..write('qContent: $qContent, ')
          ..write('qImg1: $qImg1, ')
          ..write('qImg2: $qImg2, ')
          ..write('qOpt: $qOpt, ')
          ..write('qAnswer: $qAnswer, ')
          ..write('qPoint: $qPoint, ')
          ..write('qQuicklyRem: $qQuicklyRem, ')
          ..write('qSkills: $qSkills, ')
          ..write('qAnswerDetail: $qAnswerDetail, ')
          ..write('qAnswerStatus: $qAnswerStatus, ')
          ..write('qChangeDate: $qChangeDate, ')
          ..write('qCollectionStatus: $qCollectionStatus, ')
          ..write('qDoneStatus: $qDoneStatus, ')
          ..write('isVisible: $isVisible, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        character,
        qType,
        qTypeTag,
        qDetailTag,
        qKonwTag,
        qZone,
        qContent,
        qImg1,
        qImg2,
        qOpt,
        qAnswer,
        qPoint,
        qQuicklyRem,
        qSkills,
        qAnswerDetail,
        qAnswerStatus,
        qChangeDate,
        qCollectionStatus,
        qDoneStatus,
        isVisible,
        sort
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ExamData &&
          other.id == this.id &&
          other.character == this.character &&
          other.qType == this.qType &&
          other.qTypeTag == this.qTypeTag &&
          other.qDetailTag == this.qDetailTag &&
          other.qKonwTag == this.qKonwTag &&
          other.qZone == this.qZone &&
          other.qContent == this.qContent &&
          other.qImg1 == this.qImg1 &&
          other.qImg2 == this.qImg2 &&
          other.qOpt == this.qOpt &&
          other.qAnswer == this.qAnswer &&
          other.qPoint == this.qPoint &&
          other.qQuicklyRem == this.qQuicklyRem &&
          other.qSkills == this.qSkills &&
          other.qAnswerDetail == this.qAnswerDetail &&
          other.qAnswerStatus == this.qAnswerStatus &&
          other.qChangeDate == this.qChangeDate &&
          other.qCollectionStatus == this.qCollectionStatus &&
          other.qDoneStatus == this.qDoneStatus &&
          other.isVisible == this.isVisible &&
          other.sort == this.sort);
}

class ExamCompanion extends i0.UpdateCompanion<i1.ExamData> {
  final i0.Value<int> id;
  final i0.Value<String?> character;
  final i0.Value<int> qType;
  final i0.Value<String?> qTypeTag;
  final i0.Value<String?> qDetailTag;
  final i0.Value<String?> qKonwTag;
  final i0.Value<String?> qZone;
  final i0.Value<String?> qContent;
  final i0.Value<String?> qImg1;
  final i0.Value<String?> qImg2;
  final i0.Value<String?> qOpt;
  final i0.Value<String?> qAnswer;
  final i0.Value<String?> qPoint;
  final i0.Value<int> qQuicklyRem;
  final i0.Value<int?> qSkills;
  final i0.Value<int?> qAnswerDetail;
  final i0.Value<int> qAnswerStatus;
  final i0.Value<int?> qChangeDate;
  final i0.Value<int?> qCollectionStatus;
  final i0.Value<int?> qDoneStatus;
  final i0.Value<int?> isVisible;
  final i0.Value<int> sort;
  const ExamCompanion({
    this.id = const i0.Value.absent(),
    this.character = const i0.Value.absent(),
    this.qType = const i0.Value.absent(),
    this.qTypeTag = const i0.Value.absent(),
    this.qDetailTag = const i0.Value.absent(),
    this.qKonwTag = const i0.Value.absent(),
    this.qZone = const i0.Value.absent(),
    this.qContent = const i0.Value.absent(),
    this.qImg1 = const i0.Value.absent(),
    this.qImg2 = const i0.Value.absent(),
    this.qOpt = const i0.Value.absent(),
    this.qAnswer = const i0.Value.absent(),
    this.qPoint = const i0.Value.absent(),
    this.qQuicklyRem = const i0.Value.absent(),
    this.qSkills = const i0.Value.absent(),
    this.qAnswerDetail = const i0.Value.absent(),
    this.qAnswerStatus = const i0.Value.absent(),
    this.qChangeDate = const i0.Value.absent(),
    this.qCollectionStatus = const i0.Value.absent(),
    this.qDoneStatus = const i0.Value.absent(),
    this.isVisible = const i0.Value.absent(),
    this.sort = const i0.Value.absent(),
  });
  ExamCompanion.insert({
    this.id = const i0.Value.absent(),
    this.character = const i0.Value.absent(),
    required int qType,
    this.qTypeTag = const i0.Value.absent(),
    this.qDetailTag = const i0.Value.absent(),
    this.qKonwTag = const i0.Value.absent(),
    this.qZone = const i0.Value.absent(),
    this.qContent = const i0.Value.absent(),
    this.qImg1 = const i0.Value.absent(),
    this.qImg2 = const i0.Value.absent(),
    this.qOpt = const i0.Value.absent(),
    this.qAnswer = const i0.Value.absent(),
    this.qPoint = const i0.Value.absent(),
    required int qQuicklyRem,
    this.qSkills = const i0.Value.absent(),
    this.qAnswerDetail = const i0.Value.absent(),
    this.qAnswerStatus = const i0.Value.absent(),
    this.qChangeDate = const i0.Value.absent(),
    this.qCollectionStatus = const i0.Value.absent(),
    this.qDoneStatus = const i0.Value.absent(),
    this.isVisible = const i0.Value.absent(),
    this.sort = const i0.Value.absent(),
  })  : qType = i0.Value(qType),
        qQuicklyRem = i0.Value(qQuicklyRem);
  static i0.Insertable<i1.ExamData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? character,
    i0.Expression<int>? qType,
    i0.Expression<String>? qTypeTag,
    i0.Expression<String>? qDetailTag,
    i0.Expression<String>? qKonwTag,
    i0.Expression<String>? qZone,
    i0.Expression<String>? qContent,
    i0.Expression<String>? qImg1,
    i0.Expression<String>? qImg2,
    i0.Expression<String>? qOpt,
    i0.Expression<String>? qAnswer,
    i0.Expression<String>? qPoint,
    i0.Expression<int>? qQuicklyRem,
    i0.Expression<int>? qSkills,
    i0.Expression<int>? qAnswerDetail,
    i0.Expression<int>? qAnswerStatus,
    i0.Expression<int>? qChangeDate,
    i0.Expression<int>? qCollectionStatus,
    i0.Expression<int>? qDoneStatus,
    i0.Expression<int>? isVisible,
    i0.Expression<int>? sort,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (character != null) 'character': character,
      if (qType != null) 'q_type': qType,
      if (qTypeTag != null) 'q_type_tag': qTypeTag,
      if (qDetailTag != null) 'q_detail_tag': qDetailTag,
      if (qKonwTag != null) 'q_konw_tag': qKonwTag,
      if (qZone != null) 'q_zone': qZone,
      if (qContent != null) 'q_content': qContent,
      if (qImg1 != null) 'q_img1': qImg1,
      if (qImg2 != null) 'q_img2': qImg2,
      if (qOpt != null) 'q_opt': qOpt,
      if (qAnswer != null) 'q_answer': qAnswer,
      if (qPoint != null) 'q_point': qPoint,
      if (qQuicklyRem != null) 'q_quickly_rem': qQuicklyRem,
      if (qSkills != null) 'q_skills': qSkills,
      if (qAnswerDetail != null) 'q_answer_detail': qAnswerDetail,
      if (qAnswerStatus != null) 'q_answer_status': qAnswerStatus,
      if (qChangeDate != null) 'q_change_date': qChangeDate,
      if (qCollectionStatus != null) 'q_collection_status': qCollectionStatus,
      if (qDoneStatus != null) 'q_done_status': qDoneStatus,
      if (isVisible != null) 'is_visible': isVisible,
      if (sort != null) 'sort': sort,
    });
  }

  i1.ExamCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String?>? character,
      i0.Value<int>? qType,
      i0.Value<String?>? qTypeTag,
      i0.Value<String?>? qDetailTag,
      i0.Value<String?>? qKonwTag,
      i0.Value<String?>? qZone,
      i0.Value<String?>? qContent,
      i0.Value<String?>? qImg1,
      i0.Value<String?>? qImg2,
      i0.Value<String?>? qOpt,
      i0.Value<String?>? qAnswer,
      i0.Value<String?>? qPoint,
      i0.Value<int>? qQuicklyRem,
      i0.Value<int?>? qSkills,
      i0.Value<int?>? qAnswerDetail,
      i0.Value<int>? qAnswerStatus,
      i0.Value<int?>? qChangeDate,
      i0.Value<int?>? qCollectionStatus,
      i0.Value<int?>? qDoneStatus,
      i0.Value<int?>? isVisible,
      i0.Value<int>? sort}) {
    return i1.ExamCompanion(
      id: id ?? this.id,
      character: character ?? this.character,
      qType: qType ?? this.qType,
      qTypeTag: qTypeTag ?? this.qTypeTag,
      qDetailTag: qDetailTag ?? this.qDetailTag,
      qKonwTag: qKonwTag ?? this.qKonwTag,
      qZone: qZone ?? this.qZone,
      qContent: qContent ?? this.qContent,
      qImg1: qImg1 ?? this.qImg1,
      qImg2: qImg2 ?? this.qImg2,
      qOpt: qOpt ?? this.qOpt,
      qAnswer: qAnswer ?? this.qAnswer,
      qPoint: qPoint ?? this.qPoint,
      qQuicklyRem: qQuicklyRem ?? this.qQuicklyRem,
      qSkills: qSkills ?? this.qSkills,
      qAnswerDetail: qAnswerDetail ?? this.qAnswerDetail,
      qAnswerStatus: qAnswerStatus ?? this.qAnswerStatus,
      qChangeDate: qChangeDate ?? this.qChangeDate,
      qCollectionStatus: qCollectionStatus ?? this.qCollectionStatus,
      qDoneStatus: qDoneStatus ?? this.qDoneStatus,
      isVisible: isVisible ?? this.isVisible,
      sort: sort ?? this.sort,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (character.present) {
      map['character'] = i0.Variable<String>(character.value);
    }
    if (qType.present) {
      map['q_type'] = i0.Variable<int>(qType.value);
    }
    if (qTypeTag.present) {
      map['q_type_tag'] = i0.Variable<String>(qTypeTag.value);
    }
    if (qDetailTag.present) {
      map['q_detail_tag'] = i0.Variable<String>(qDetailTag.value);
    }
    if (qKonwTag.present) {
      map['q_konw_tag'] = i0.Variable<String>(qKonwTag.value);
    }
    if (qZone.present) {
      map['q_zone'] = i0.Variable<String>(qZone.value);
    }
    if (qContent.present) {
      map['q_content'] = i0.Variable<String>(qContent.value);
    }
    if (qImg1.present) {
      map['q_img1'] = i0.Variable<String>(qImg1.value);
    }
    if (qImg2.present) {
      map['q_img2'] = i0.Variable<String>(qImg2.value);
    }
    if (qOpt.present) {
      map['q_opt'] = i0.Variable<String>(qOpt.value);
    }
    if (qAnswer.present) {
      map['q_answer'] = i0.Variable<String>(qAnswer.value);
    }
    if (qPoint.present) {
      map['q_point'] = i0.Variable<String>(qPoint.value);
    }
    if (qQuicklyRem.present) {
      map['q_quickly_rem'] = i0.Variable<int>(qQuicklyRem.value);
    }
    if (qSkills.present) {
      map['q_skills'] = i0.Variable<int>(qSkills.value);
    }
    if (qAnswerDetail.present) {
      map['q_answer_detail'] = i0.Variable<int>(qAnswerDetail.value);
    }
    if (qAnswerStatus.present) {
      map['q_answer_status'] = i0.Variable<int>(qAnswerStatus.value);
    }
    if (qChangeDate.present) {
      map['q_change_date'] = i0.Variable<int>(qChangeDate.value);
    }
    if (qCollectionStatus.present) {
      map['q_collection_status'] = i0.Variable<int>(qCollectionStatus.value);
    }
    if (qDoneStatus.present) {
      map['q_done_status'] = i0.Variable<int>(qDoneStatus.value);
    }
    if (isVisible.present) {
      map['is_visible'] = i0.Variable<int>(isVisible.value);
    }
    if (sort.present) {
      map['sort'] = i0.Variable<int>(sort.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamCompanion(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('qType: $qType, ')
          ..write('qTypeTag: $qTypeTag, ')
          ..write('qDetailTag: $qDetailTag, ')
          ..write('qKonwTag: $qKonwTag, ')
          ..write('qZone: $qZone, ')
          ..write('qContent: $qContent, ')
          ..write('qImg1: $qImg1, ')
          ..write('qImg2: $qImg2, ')
          ..write('qOpt: $qOpt, ')
          ..write('qAnswer: $qAnswer, ')
          ..write('qPoint: $qPoint, ')
          ..write('qQuicklyRem: $qQuicklyRem, ')
          ..write('qSkills: $qSkills, ')
          ..write('qAnswerDetail: $qAnswerDetail, ')
          ..write('qAnswerStatus: $qAnswerStatus, ')
          ..write('qChangeDate: $qChangeDate, ')
          ..write('qCollectionStatus: $qCollectionStatus, ')
          ..write('qDoneStatus: $qDoneStatus, ')
          ..write('isVisible: $isVisible, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }
}

class Exam500 extends i0.Table with i0.TableInfo<Exam500, i1.Exam500Data> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Exam500(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const i0.VerificationMeta _characterMeta =
      const i0.VerificationMeta('character');
  late final i0.GeneratedColumn<String> character = i0.GeneratedColumn<String>(
      'character', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qTypeMeta =
      const i0.VerificationMeta('qType');
  late final i0.GeneratedColumn<int> qType = i0.GeneratedColumn<int>(
      'q_type', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _qTypeTagMeta =
      const i0.VerificationMeta('qTypeTag');
  late final i0.GeneratedColumn<String> qTypeTag = i0.GeneratedColumn<String>(
      'q_type_tag', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qDetailTagMeta =
      const i0.VerificationMeta('qDetailTag');
  late final i0.GeneratedColumn<String> qDetailTag = i0.GeneratedColumn<String>(
      'q_detail_tag', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qKonwTagMeta =
      const i0.VerificationMeta('qKonwTag');
  late final i0.GeneratedColumn<String> qKonwTag = i0.GeneratedColumn<String>(
      'q_konw_tag', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qZoneMeta =
      const i0.VerificationMeta('qZone');
  late final i0.GeneratedColumn<String> qZone = i0.GeneratedColumn<String>(
      'q_zone', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qContentMeta =
      const i0.VerificationMeta('qContent');
  late final i0.GeneratedColumn<String> qContent = i0.GeneratedColumn<String>(
      'q_content', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qImg1Meta =
      const i0.VerificationMeta('qImg1');
  late final i0.GeneratedColumn<String> qImg1 = i0.GeneratedColumn<String>(
      'q_img1', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qImg2Meta =
      const i0.VerificationMeta('qImg2');
  late final i0.GeneratedColumn<String> qImg2 = i0.GeneratedColumn<String>(
      'q_img2', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qOptMeta =
      const i0.VerificationMeta('qOpt');
  late final i0.GeneratedColumn<String> qOpt = i0.GeneratedColumn<String>(
      'q_opt', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qAnswerMeta =
      const i0.VerificationMeta('qAnswer');
  late final i0.GeneratedColumn<String> qAnswer = i0.GeneratedColumn<String>(
      'q_answer', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qPointMeta =
      const i0.VerificationMeta('qPoint');
  late final i0.GeneratedColumn<String> qPoint = i0.GeneratedColumn<String>(
      'q_point', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qQuicklyRemMeta =
      const i0.VerificationMeta('qQuicklyRem');
  late final i0.GeneratedColumn<int> qQuicklyRem = i0.GeneratedColumn<int>(
      'q_quickly_rem', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const i0.VerificationMeta _qSkillsMeta =
      const i0.VerificationMeta('qSkills');
  late final i0.GeneratedColumn<int> qSkills = i0.GeneratedColumn<int>(
      'q_skills', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qAnswerDetailMeta =
      const i0.VerificationMeta('qAnswerDetail');
  late final i0.GeneratedColumn<int> qAnswerDetail = i0.GeneratedColumn<int>(
      'q_answer_detail', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _qAnswerStatusMeta =
      const i0.VerificationMeta('qAnswerStatus');
  late final i0.GeneratedColumn<int> qAnswerStatus = i0.GeneratedColumn<int>(
      'q_answer_status', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const i0.CustomExpression('1'));
  static const i0.VerificationMeta _qCollectionStatusMeta =
      const i0.VerificationMeta('qCollectionStatus');
  late final i0.GeneratedColumn<int> qCollectionStatus =
      i0.GeneratedColumn<int>('q_collection_status', aliasedName, true,
          type: i0.DriftSqlType.int,
          requiredDuringInsert: false,
          $customConstraints: 'DEFAULT 0',
          defaultValue: const i0.CustomExpression('0'));
  static const i0.VerificationMeta _stepMeta =
      const i0.VerificationMeta('step');
  late final i0.GeneratedColumn<int> step = i0.GeneratedColumn<int>(
      'step', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const i0.VerificationMeta _sortMeta =
      const i0.VerificationMeta('sort');
  late final i0.GeneratedColumn<int> sort = i0.GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const i0.CustomExpression('0'));
  @override
  List<i0.GeneratedColumn> get $columns => [
        id,
        character,
        qType,
        qTypeTag,
        qDetailTag,
        qKonwTag,
        qZone,
        qContent,
        qImg1,
        qImg2,
        qOpt,
        qAnswer,
        qPoint,
        qQuicklyRem,
        qSkills,
        qAnswerDetail,
        qAnswerStatus,
        qCollectionStatus,
        step,
        sort
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_500';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.Exam500Data> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character')) {
      context.handle(_characterMeta,
          character.isAcceptableOrUnknown(data['character']!, _characterMeta));
    }
    if (data.containsKey('q_type')) {
      context.handle(
          _qTypeMeta, qType.isAcceptableOrUnknown(data['q_type']!, _qTypeMeta));
    } else if (isInserting) {
      context.missing(_qTypeMeta);
    }
    if (data.containsKey('q_type_tag')) {
      context.handle(_qTypeTagMeta,
          qTypeTag.isAcceptableOrUnknown(data['q_type_tag']!, _qTypeTagMeta));
    }
    if (data.containsKey('q_detail_tag')) {
      context.handle(
          _qDetailTagMeta,
          qDetailTag.isAcceptableOrUnknown(
              data['q_detail_tag']!, _qDetailTagMeta));
    }
    if (data.containsKey('q_konw_tag')) {
      context.handle(_qKonwTagMeta,
          qKonwTag.isAcceptableOrUnknown(data['q_konw_tag']!, _qKonwTagMeta));
    }
    if (data.containsKey('q_zone')) {
      context.handle(
          _qZoneMeta, qZone.isAcceptableOrUnknown(data['q_zone']!, _qZoneMeta));
    }
    if (data.containsKey('q_content')) {
      context.handle(_qContentMeta,
          qContent.isAcceptableOrUnknown(data['q_content']!, _qContentMeta));
    }
    if (data.containsKey('q_img1')) {
      context.handle(
          _qImg1Meta, qImg1.isAcceptableOrUnknown(data['q_img1']!, _qImg1Meta));
    }
    if (data.containsKey('q_img2')) {
      context.handle(
          _qImg2Meta, qImg2.isAcceptableOrUnknown(data['q_img2']!, _qImg2Meta));
    }
    if (data.containsKey('q_opt')) {
      context.handle(
          _qOptMeta, qOpt.isAcceptableOrUnknown(data['q_opt']!, _qOptMeta));
    }
    if (data.containsKey('q_answer')) {
      context.handle(_qAnswerMeta,
          qAnswer.isAcceptableOrUnknown(data['q_answer']!, _qAnswerMeta));
    }
    if (data.containsKey('q_point')) {
      context.handle(_qPointMeta,
          qPoint.isAcceptableOrUnknown(data['q_point']!, _qPointMeta));
    }
    if (data.containsKey('q_quickly_rem')) {
      context.handle(
          _qQuicklyRemMeta,
          qQuicklyRem.isAcceptableOrUnknown(
              data['q_quickly_rem']!, _qQuicklyRemMeta));
    } else if (isInserting) {
      context.missing(_qQuicklyRemMeta);
    }
    if (data.containsKey('q_skills')) {
      context.handle(_qSkillsMeta,
          qSkills.isAcceptableOrUnknown(data['q_skills']!, _qSkillsMeta));
    }
    if (data.containsKey('q_answer_detail')) {
      context.handle(
          _qAnswerDetailMeta,
          qAnswerDetail.isAcceptableOrUnknown(
              data['q_answer_detail']!, _qAnswerDetailMeta));
    }
    if (data.containsKey('q_answer_status')) {
      context.handle(
          _qAnswerStatusMeta,
          qAnswerStatus.isAcceptableOrUnknown(
              data['q_answer_status']!, _qAnswerStatusMeta));
    }
    if (data.containsKey('q_collection_status')) {
      context.handle(
          _qCollectionStatusMeta,
          qCollectionStatus.isAcceptableOrUnknown(
              data['q_collection_status']!, _qCollectionStatusMeta));
    }
    if (data.containsKey('step')) {
      context.handle(
          _stepMeta, step.isAcceptableOrUnknown(data['step']!, _stepMeta));
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Exam500Data map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Exam500Data(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      character: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}character']),
      qType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_type'])!,
      qTypeTag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_type_tag']),
      qDetailTag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_detail_tag']),
      qKonwTag: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_konw_tag']),
      qZone: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_zone']),
      qContent: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_content']),
      qImg1: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_img1']),
      qImg2: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_img2']),
      qOpt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_opt']),
      qAnswer: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_answer']),
      qPoint: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}q_point']),
      qQuicklyRem: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_quickly_rem'])!,
      qSkills: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_skills']),
      qAnswerDetail: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}q_answer_detail']),
      qAnswerStatus: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}q_answer_status'])!,
      qCollectionStatus: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}q_collection_status']),
      step: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}step']),
      sort: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}sort'])!,
    );
  }

  @override
  Exam500 createAlias(String alias) {
    return Exam500(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Exam500Data extends i0.DataClass
    implements i0.Insertable<i1.Exam500Data> {
  final int id;
  final String? character;
  final int qType;
  final String? qTypeTag;
  final String? qDetailTag;
  final String? qKonwTag;
  final String? qZone;
  final String? qContent;
  final String? qImg1;
  final String? qImg2;
  final String? qOpt;
  final String? qAnswer;
  final String? qPoint;
  final int qQuicklyRem;
  final int? qSkills;
  final int? qAnswerDetail;
  final int qAnswerStatus;
  final int? qCollectionStatus;
  final int? step;
  final int sort;
  const Exam500Data(
      {required this.id,
      this.character,
      required this.qType,
      this.qTypeTag,
      this.qDetailTag,
      this.qKonwTag,
      this.qZone,
      this.qContent,
      this.qImg1,
      this.qImg2,
      this.qOpt,
      this.qAnswer,
      this.qPoint,
      required this.qQuicklyRem,
      this.qSkills,
      this.qAnswerDetail,
      required this.qAnswerStatus,
      this.qCollectionStatus,
      this.step,
      required this.sort});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    if (!nullToAbsent || character != null) {
      map['character'] = i0.Variable<String>(character);
    }
    map['q_type'] = i0.Variable<int>(qType);
    if (!nullToAbsent || qTypeTag != null) {
      map['q_type_tag'] = i0.Variable<String>(qTypeTag);
    }
    if (!nullToAbsent || qDetailTag != null) {
      map['q_detail_tag'] = i0.Variable<String>(qDetailTag);
    }
    if (!nullToAbsent || qKonwTag != null) {
      map['q_konw_tag'] = i0.Variable<String>(qKonwTag);
    }
    if (!nullToAbsent || qZone != null) {
      map['q_zone'] = i0.Variable<String>(qZone);
    }
    if (!nullToAbsent || qContent != null) {
      map['q_content'] = i0.Variable<String>(qContent);
    }
    if (!nullToAbsent || qImg1 != null) {
      map['q_img1'] = i0.Variable<String>(qImg1);
    }
    if (!nullToAbsent || qImg2 != null) {
      map['q_img2'] = i0.Variable<String>(qImg2);
    }
    if (!nullToAbsent || qOpt != null) {
      map['q_opt'] = i0.Variable<String>(qOpt);
    }
    if (!nullToAbsent || qAnswer != null) {
      map['q_answer'] = i0.Variable<String>(qAnswer);
    }
    if (!nullToAbsent || qPoint != null) {
      map['q_point'] = i0.Variable<String>(qPoint);
    }
    map['q_quickly_rem'] = i0.Variable<int>(qQuicklyRem);
    if (!nullToAbsent || qSkills != null) {
      map['q_skills'] = i0.Variable<int>(qSkills);
    }
    if (!nullToAbsent || qAnswerDetail != null) {
      map['q_answer_detail'] = i0.Variable<int>(qAnswerDetail);
    }
    map['q_answer_status'] = i0.Variable<int>(qAnswerStatus);
    if (!nullToAbsent || qCollectionStatus != null) {
      map['q_collection_status'] = i0.Variable<int>(qCollectionStatus);
    }
    if (!nullToAbsent || step != null) {
      map['step'] = i0.Variable<int>(step);
    }
    map['sort'] = i0.Variable<int>(sort);
    return map;
  }

  i1.Exam500Companion toCompanion(bool nullToAbsent) {
    return i1.Exam500Companion(
      id: i0.Value(id),
      character: character == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(character),
      qType: i0.Value(qType),
      qTypeTag: qTypeTag == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qTypeTag),
      qDetailTag: qDetailTag == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qDetailTag),
      qKonwTag: qKonwTag == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qKonwTag),
      qZone: qZone == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qZone),
      qContent: qContent == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qContent),
      qImg1: qImg1 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qImg1),
      qImg2: qImg2 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qImg2),
      qOpt: qOpt == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qOpt),
      qAnswer: qAnswer == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qAnswer),
      qPoint: qPoint == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qPoint),
      qQuicklyRem: i0.Value(qQuicklyRem),
      qSkills: qSkills == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qSkills),
      qAnswerDetail: qAnswerDetail == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qAnswerDetail),
      qAnswerStatus: i0.Value(qAnswerStatus),
      qCollectionStatus: qCollectionStatus == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(qCollectionStatus),
      step: step == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(step),
      sort: i0.Value(sort),
    );
  }

  factory Exam500Data.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Exam500Data(
      id: serializer.fromJson<int>(json['id']),
      character: serializer.fromJson<String?>(json['character']),
      qType: serializer.fromJson<int>(json['q_type']),
      qTypeTag: serializer.fromJson<String?>(json['q_type_tag']),
      qDetailTag: serializer.fromJson<String?>(json['q_detail_tag']),
      qKonwTag: serializer.fromJson<String?>(json['q_konw_tag']),
      qZone: serializer.fromJson<String?>(json['q_zone']),
      qContent: serializer.fromJson<String?>(json['q_content']),
      qImg1: serializer.fromJson<String?>(json['q_img1']),
      qImg2: serializer.fromJson<String?>(json['q_img2']),
      qOpt: serializer.fromJson<String?>(json['q_opt']),
      qAnswer: serializer.fromJson<String?>(json['q_answer']),
      qPoint: serializer.fromJson<String?>(json['q_point']),
      qQuicklyRem: serializer.fromJson<int>(json['q_quickly_rem']),
      qSkills: serializer.fromJson<int?>(json['q_skills']),
      qAnswerDetail: serializer.fromJson<int?>(json['q_answer_detail']),
      qAnswerStatus: serializer.fromJson<int>(json['q_answer_status']),
      qCollectionStatus: serializer.fromJson<int?>(json['q_collection_status']),
      step: serializer.fromJson<int?>(json['step']),
      sort: serializer.fromJson<int>(json['sort']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'character': serializer.toJson<String?>(character),
      'q_type': serializer.toJson<int>(qType),
      'q_type_tag': serializer.toJson<String?>(qTypeTag),
      'q_detail_tag': serializer.toJson<String?>(qDetailTag),
      'q_konw_tag': serializer.toJson<String?>(qKonwTag),
      'q_zone': serializer.toJson<String?>(qZone),
      'q_content': serializer.toJson<String?>(qContent),
      'q_img1': serializer.toJson<String?>(qImg1),
      'q_img2': serializer.toJson<String?>(qImg2),
      'q_opt': serializer.toJson<String?>(qOpt),
      'q_answer': serializer.toJson<String?>(qAnswer),
      'q_point': serializer.toJson<String?>(qPoint),
      'q_quickly_rem': serializer.toJson<int>(qQuicklyRem),
      'q_skills': serializer.toJson<int?>(qSkills),
      'q_answer_detail': serializer.toJson<int?>(qAnswerDetail),
      'q_answer_status': serializer.toJson<int>(qAnswerStatus),
      'q_collection_status': serializer.toJson<int?>(qCollectionStatus),
      'step': serializer.toJson<int?>(step),
      'sort': serializer.toJson<int>(sort),
    };
  }

  i1.Exam500Data copyWith(
          {int? id,
          i0.Value<String?> character = const i0.Value.absent(),
          int? qType,
          i0.Value<String?> qTypeTag = const i0.Value.absent(),
          i0.Value<String?> qDetailTag = const i0.Value.absent(),
          i0.Value<String?> qKonwTag = const i0.Value.absent(),
          i0.Value<String?> qZone = const i0.Value.absent(),
          i0.Value<String?> qContent = const i0.Value.absent(),
          i0.Value<String?> qImg1 = const i0.Value.absent(),
          i0.Value<String?> qImg2 = const i0.Value.absent(),
          i0.Value<String?> qOpt = const i0.Value.absent(),
          i0.Value<String?> qAnswer = const i0.Value.absent(),
          i0.Value<String?> qPoint = const i0.Value.absent(),
          int? qQuicklyRem,
          i0.Value<int?> qSkills = const i0.Value.absent(),
          i0.Value<int?> qAnswerDetail = const i0.Value.absent(),
          int? qAnswerStatus,
          i0.Value<int?> qCollectionStatus = const i0.Value.absent(),
          i0.Value<int?> step = const i0.Value.absent(),
          int? sort}) =>
      i1.Exam500Data(
        id: id ?? this.id,
        character: character.present ? character.value : this.character,
        qType: qType ?? this.qType,
        qTypeTag: qTypeTag.present ? qTypeTag.value : this.qTypeTag,
        qDetailTag: qDetailTag.present ? qDetailTag.value : this.qDetailTag,
        qKonwTag: qKonwTag.present ? qKonwTag.value : this.qKonwTag,
        qZone: qZone.present ? qZone.value : this.qZone,
        qContent: qContent.present ? qContent.value : this.qContent,
        qImg1: qImg1.present ? qImg1.value : this.qImg1,
        qImg2: qImg2.present ? qImg2.value : this.qImg2,
        qOpt: qOpt.present ? qOpt.value : this.qOpt,
        qAnswer: qAnswer.present ? qAnswer.value : this.qAnswer,
        qPoint: qPoint.present ? qPoint.value : this.qPoint,
        qQuicklyRem: qQuicklyRem ?? this.qQuicklyRem,
        qSkills: qSkills.present ? qSkills.value : this.qSkills,
        qAnswerDetail:
            qAnswerDetail.present ? qAnswerDetail.value : this.qAnswerDetail,
        qAnswerStatus: qAnswerStatus ?? this.qAnswerStatus,
        qCollectionStatus: qCollectionStatus.present
            ? qCollectionStatus.value
            : this.qCollectionStatus,
        step: step.present ? step.value : this.step,
        sort: sort ?? this.sort,
      );
  Exam500Data copyWithCompanion(i1.Exam500Companion data) {
    return Exam500Data(
      id: data.id.present ? data.id.value : this.id,
      character: data.character.present ? data.character.value : this.character,
      qType: data.qType.present ? data.qType.value : this.qType,
      qTypeTag: data.qTypeTag.present ? data.qTypeTag.value : this.qTypeTag,
      qDetailTag:
          data.qDetailTag.present ? data.qDetailTag.value : this.qDetailTag,
      qKonwTag: data.qKonwTag.present ? data.qKonwTag.value : this.qKonwTag,
      qZone: data.qZone.present ? data.qZone.value : this.qZone,
      qContent: data.qContent.present ? data.qContent.value : this.qContent,
      qImg1: data.qImg1.present ? data.qImg1.value : this.qImg1,
      qImg2: data.qImg2.present ? data.qImg2.value : this.qImg2,
      qOpt: data.qOpt.present ? data.qOpt.value : this.qOpt,
      qAnswer: data.qAnswer.present ? data.qAnswer.value : this.qAnswer,
      qPoint: data.qPoint.present ? data.qPoint.value : this.qPoint,
      qQuicklyRem:
          data.qQuicklyRem.present ? data.qQuicklyRem.value : this.qQuicklyRem,
      qSkills: data.qSkills.present ? data.qSkills.value : this.qSkills,
      qAnswerDetail: data.qAnswerDetail.present
          ? data.qAnswerDetail.value
          : this.qAnswerDetail,
      qAnswerStatus: data.qAnswerStatus.present
          ? data.qAnswerStatus.value
          : this.qAnswerStatus,
      qCollectionStatus: data.qCollectionStatus.present
          ? data.qCollectionStatus.value
          : this.qCollectionStatus,
      step: data.step.present ? data.step.value : this.step,
      sort: data.sort.present ? data.sort.value : this.sort,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exam500Data(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('qType: $qType, ')
          ..write('qTypeTag: $qTypeTag, ')
          ..write('qDetailTag: $qDetailTag, ')
          ..write('qKonwTag: $qKonwTag, ')
          ..write('qZone: $qZone, ')
          ..write('qContent: $qContent, ')
          ..write('qImg1: $qImg1, ')
          ..write('qImg2: $qImg2, ')
          ..write('qOpt: $qOpt, ')
          ..write('qAnswer: $qAnswer, ')
          ..write('qPoint: $qPoint, ')
          ..write('qQuicklyRem: $qQuicklyRem, ')
          ..write('qSkills: $qSkills, ')
          ..write('qAnswerDetail: $qAnswerDetail, ')
          ..write('qAnswerStatus: $qAnswerStatus, ')
          ..write('qCollectionStatus: $qCollectionStatus, ')
          ..write('step: $step, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      character,
      qType,
      qTypeTag,
      qDetailTag,
      qKonwTag,
      qZone,
      qContent,
      qImg1,
      qImg2,
      qOpt,
      qAnswer,
      qPoint,
      qQuicklyRem,
      qSkills,
      qAnswerDetail,
      qAnswerStatus,
      qCollectionStatus,
      step,
      sort);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Exam500Data &&
          other.id == this.id &&
          other.character == this.character &&
          other.qType == this.qType &&
          other.qTypeTag == this.qTypeTag &&
          other.qDetailTag == this.qDetailTag &&
          other.qKonwTag == this.qKonwTag &&
          other.qZone == this.qZone &&
          other.qContent == this.qContent &&
          other.qImg1 == this.qImg1 &&
          other.qImg2 == this.qImg2 &&
          other.qOpt == this.qOpt &&
          other.qAnswer == this.qAnswer &&
          other.qPoint == this.qPoint &&
          other.qQuicklyRem == this.qQuicklyRem &&
          other.qSkills == this.qSkills &&
          other.qAnswerDetail == this.qAnswerDetail &&
          other.qAnswerStatus == this.qAnswerStatus &&
          other.qCollectionStatus == this.qCollectionStatus &&
          other.step == this.step &&
          other.sort == this.sort);
}

class Exam500Companion extends i0.UpdateCompanion<i1.Exam500Data> {
  final i0.Value<int> id;
  final i0.Value<String?> character;
  final i0.Value<int> qType;
  final i0.Value<String?> qTypeTag;
  final i0.Value<String?> qDetailTag;
  final i0.Value<String?> qKonwTag;
  final i0.Value<String?> qZone;
  final i0.Value<String?> qContent;
  final i0.Value<String?> qImg1;
  final i0.Value<String?> qImg2;
  final i0.Value<String?> qOpt;
  final i0.Value<String?> qAnswer;
  final i0.Value<String?> qPoint;
  final i0.Value<int> qQuicklyRem;
  final i0.Value<int?> qSkills;
  final i0.Value<int?> qAnswerDetail;
  final i0.Value<int> qAnswerStatus;
  final i0.Value<int?> qCollectionStatus;
  final i0.Value<int?> step;
  final i0.Value<int> sort;
  const Exam500Companion({
    this.id = const i0.Value.absent(),
    this.character = const i0.Value.absent(),
    this.qType = const i0.Value.absent(),
    this.qTypeTag = const i0.Value.absent(),
    this.qDetailTag = const i0.Value.absent(),
    this.qKonwTag = const i0.Value.absent(),
    this.qZone = const i0.Value.absent(),
    this.qContent = const i0.Value.absent(),
    this.qImg1 = const i0.Value.absent(),
    this.qImg2 = const i0.Value.absent(),
    this.qOpt = const i0.Value.absent(),
    this.qAnswer = const i0.Value.absent(),
    this.qPoint = const i0.Value.absent(),
    this.qQuicklyRem = const i0.Value.absent(),
    this.qSkills = const i0.Value.absent(),
    this.qAnswerDetail = const i0.Value.absent(),
    this.qAnswerStatus = const i0.Value.absent(),
    this.qCollectionStatus = const i0.Value.absent(),
    this.step = const i0.Value.absent(),
    this.sort = const i0.Value.absent(),
  });
  Exam500Companion.insert({
    this.id = const i0.Value.absent(),
    this.character = const i0.Value.absent(),
    required int qType,
    this.qTypeTag = const i0.Value.absent(),
    this.qDetailTag = const i0.Value.absent(),
    this.qKonwTag = const i0.Value.absent(),
    this.qZone = const i0.Value.absent(),
    this.qContent = const i0.Value.absent(),
    this.qImg1 = const i0.Value.absent(),
    this.qImg2 = const i0.Value.absent(),
    this.qOpt = const i0.Value.absent(),
    this.qAnswer = const i0.Value.absent(),
    this.qPoint = const i0.Value.absent(),
    required int qQuicklyRem,
    this.qSkills = const i0.Value.absent(),
    this.qAnswerDetail = const i0.Value.absent(),
    this.qAnswerStatus = const i0.Value.absent(),
    this.qCollectionStatus = const i0.Value.absent(),
    this.step = const i0.Value.absent(),
    this.sort = const i0.Value.absent(),
  })  : qType = i0.Value(qType),
        qQuicklyRem = i0.Value(qQuicklyRem);
  static i0.Insertable<i1.Exam500Data> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? character,
    i0.Expression<int>? qType,
    i0.Expression<String>? qTypeTag,
    i0.Expression<String>? qDetailTag,
    i0.Expression<String>? qKonwTag,
    i0.Expression<String>? qZone,
    i0.Expression<String>? qContent,
    i0.Expression<String>? qImg1,
    i0.Expression<String>? qImg2,
    i0.Expression<String>? qOpt,
    i0.Expression<String>? qAnswer,
    i0.Expression<String>? qPoint,
    i0.Expression<int>? qQuicklyRem,
    i0.Expression<int>? qSkills,
    i0.Expression<int>? qAnswerDetail,
    i0.Expression<int>? qAnswerStatus,
    i0.Expression<int>? qCollectionStatus,
    i0.Expression<int>? step,
    i0.Expression<int>? sort,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (character != null) 'character': character,
      if (qType != null) 'q_type': qType,
      if (qTypeTag != null) 'q_type_tag': qTypeTag,
      if (qDetailTag != null) 'q_detail_tag': qDetailTag,
      if (qKonwTag != null) 'q_konw_tag': qKonwTag,
      if (qZone != null) 'q_zone': qZone,
      if (qContent != null) 'q_content': qContent,
      if (qImg1 != null) 'q_img1': qImg1,
      if (qImg2 != null) 'q_img2': qImg2,
      if (qOpt != null) 'q_opt': qOpt,
      if (qAnswer != null) 'q_answer': qAnswer,
      if (qPoint != null) 'q_point': qPoint,
      if (qQuicklyRem != null) 'q_quickly_rem': qQuicklyRem,
      if (qSkills != null) 'q_skills': qSkills,
      if (qAnswerDetail != null) 'q_answer_detail': qAnswerDetail,
      if (qAnswerStatus != null) 'q_answer_status': qAnswerStatus,
      if (qCollectionStatus != null) 'q_collection_status': qCollectionStatus,
      if (step != null) 'step': step,
      if (sort != null) 'sort': sort,
    });
  }

  i1.Exam500Companion copyWith(
      {i0.Value<int>? id,
      i0.Value<String?>? character,
      i0.Value<int>? qType,
      i0.Value<String?>? qTypeTag,
      i0.Value<String?>? qDetailTag,
      i0.Value<String?>? qKonwTag,
      i0.Value<String?>? qZone,
      i0.Value<String?>? qContent,
      i0.Value<String?>? qImg1,
      i0.Value<String?>? qImg2,
      i0.Value<String?>? qOpt,
      i0.Value<String?>? qAnswer,
      i0.Value<String?>? qPoint,
      i0.Value<int>? qQuicklyRem,
      i0.Value<int?>? qSkills,
      i0.Value<int?>? qAnswerDetail,
      i0.Value<int>? qAnswerStatus,
      i0.Value<int?>? qCollectionStatus,
      i0.Value<int?>? step,
      i0.Value<int>? sort}) {
    return i1.Exam500Companion(
      id: id ?? this.id,
      character: character ?? this.character,
      qType: qType ?? this.qType,
      qTypeTag: qTypeTag ?? this.qTypeTag,
      qDetailTag: qDetailTag ?? this.qDetailTag,
      qKonwTag: qKonwTag ?? this.qKonwTag,
      qZone: qZone ?? this.qZone,
      qContent: qContent ?? this.qContent,
      qImg1: qImg1 ?? this.qImg1,
      qImg2: qImg2 ?? this.qImg2,
      qOpt: qOpt ?? this.qOpt,
      qAnswer: qAnswer ?? this.qAnswer,
      qPoint: qPoint ?? this.qPoint,
      qQuicklyRem: qQuicklyRem ?? this.qQuicklyRem,
      qSkills: qSkills ?? this.qSkills,
      qAnswerDetail: qAnswerDetail ?? this.qAnswerDetail,
      qAnswerStatus: qAnswerStatus ?? this.qAnswerStatus,
      qCollectionStatus: qCollectionStatus ?? this.qCollectionStatus,
      step: step ?? this.step,
      sort: sort ?? this.sort,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (character.present) {
      map['character'] = i0.Variable<String>(character.value);
    }
    if (qType.present) {
      map['q_type'] = i0.Variable<int>(qType.value);
    }
    if (qTypeTag.present) {
      map['q_type_tag'] = i0.Variable<String>(qTypeTag.value);
    }
    if (qDetailTag.present) {
      map['q_detail_tag'] = i0.Variable<String>(qDetailTag.value);
    }
    if (qKonwTag.present) {
      map['q_konw_tag'] = i0.Variable<String>(qKonwTag.value);
    }
    if (qZone.present) {
      map['q_zone'] = i0.Variable<String>(qZone.value);
    }
    if (qContent.present) {
      map['q_content'] = i0.Variable<String>(qContent.value);
    }
    if (qImg1.present) {
      map['q_img1'] = i0.Variable<String>(qImg1.value);
    }
    if (qImg2.present) {
      map['q_img2'] = i0.Variable<String>(qImg2.value);
    }
    if (qOpt.present) {
      map['q_opt'] = i0.Variable<String>(qOpt.value);
    }
    if (qAnswer.present) {
      map['q_answer'] = i0.Variable<String>(qAnswer.value);
    }
    if (qPoint.present) {
      map['q_point'] = i0.Variable<String>(qPoint.value);
    }
    if (qQuicklyRem.present) {
      map['q_quickly_rem'] = i0.Variable<int>(qQuicklyRem.value);
    }
    if (qSkills.present) {
      map['q_skills'] = i0.Variable<int>(qSkills.value);
    }
    if (qAnswerDetail.present) {
      map['q_answer_detail'] = i0.Variable<int>(qAnswerDetail.value);
    }
    if (qAnswerStatus.present) {
      map['q_answer_status'] = i0.Variable<int>(qAnswerStatus.value);
    }
    if (qCollectionStatus.present) {
      map['q_collection_status'] = i0.Variable<int>(qCollectionStatus.value);
    }
    if (step.present) {
      map['step'] = i0.Variable<int>(step.value);
    }
    if (sort.present) {
      map['sort'] = i0.Variable<int>(sort.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Exam500Companion(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('qType: $qType, ')
          ..write('qTypeTag: $qTypeTag, ')
          ..write('qDetailTag: $qDetailTag, ')
          ..write('qKonwTag: $qKonwTag, ')
          ..write('qZone: $qZone, ')
          ..write('qContent: $qContent, ')
          ..write('qImg1: $qImg1, ')
          ..write('qImg2: $qImg2, ')
          ..write('qOpt: $qOpt, ')
          ..write('qAnswer: $qAnswer, ')
          ..write('qPoint: $qPoint, ')
          ..write('qQuicklyRem: $qQuicklyRem, ')
          ..write('qSkills: $qSkills, ')
          ..write('qAnswerDetail: $qAnswerDetail, ')
          ..write('qAnswerStatus: $qAnswerStatus, ')
          ..write('qCollectionStatus: $qCollectionStatus, ')
          ..write('step: $step, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }
}
