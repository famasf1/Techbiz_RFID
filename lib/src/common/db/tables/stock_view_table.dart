import 'package:drift/drift.dart';
import 'package:techbiz_rfid/src/common/db/tables/user_table.dart';

class StockView extends Table {
  IntColumn get productId => integer().autoIncrement()();
  TextColumn get productCode => text()();
  TextColumn get productName => text()();
  TextColumn get productSerial => text().nullable()();
  IntColumn get price => integer()();
  IntColumn get quantity => integer()();
  DateTimeColumn get createdDate => dateTime()();

  @ReferenceName('createdByUser')
  IntColumn get createdBy => integer().nullable().references(User, #userId)();

  DateTimeColumn get updatedDate => dateTime()();

  @ReferenceName('updatedByUser')
  IntColumn get updatedBy => integer().nullable().references(User, #userId)();
}