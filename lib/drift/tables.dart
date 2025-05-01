import 'dart:ui';

export 'dart:ui' show Color;

import 'package:drift/drift.dart';


class TodoItems extends Table with AutoIncrementingPrimaryKey {
  TextColumn get title => text().withLength(min: 0, max: 32)();

  TextColumn get content => text().named('body')();

  DateTimeColumn get createdAt => dateTime().nullable()();
}

@DataClassName('Category')
class Categories extends Table with AutoIncrementingPrimaryKey {
  TextColumn get name => text()();

  // We can use type converters to store custom classes in tables.
  // Here, we're storing colors as integers.
  IntColumn get color => integer().map(const ColorConverter())();
}

// Tables can mix-in common definitions if needed
mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}

class ColorConverter extends TypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromSql(int fromDb) => Color(fromDb);

  @override
  // ignore: deprecated_member_use
  int toSql(Color value) => value.value;
}
