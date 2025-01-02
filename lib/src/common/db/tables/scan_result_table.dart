import 'package:drift/drift.dart';
import 'package:techbiz_rfid/src/common/db/tables/user_table.dart';

class ScanResult extends Table {
  IntColumn get scanResultId => integer().autoIncrement()();
  TextColumn get scanSetName => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  @ReferenceName('scanResultCreatedBy')
  IntColumn get createdBy => integer().nullable().references(User, #userId).withDefault(Constant(1))();
  DateTimeColumn get updatedDate => dateTime().withDefault(Constant(DateTime.now()))();
  @ReferenceName('scanResultUpdatedBy')
  IntColumn get updatedBy => integer().nullable().references(User, #userId).withDefault(Constant(1))();
}

class ScanResultItem extends Table {
  IntColumn get scanResultItemId => integer().autoIncrement()();
  IntColumn get scanResultId => integer().references(ScanResult, #scanResultId).withDefault(Constant(1))();
  TextColumn get productCode => text()();
  TextColumn get productName => text()();
  TextColumn get productSerial => text().nullable()();
  IntColumn get price => integer()();
  IntColumn get quantity => integer()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  @ReferenceName('scanResultItemsCreatedBy')
  IntColumn get createdBy => integer().nullable().references(User, #userId).withDefault(Constant(1))();
  DateTimeColumn get updatedDate => dateTime().withDefault(Constant(DateTime.now()))();
  @ReferenceName('scanResultItemsUpdatedBy')
  IntColumn get updatedBy => integer().nullable().references(User, #userId).withDefault(Constant(1))();
}
