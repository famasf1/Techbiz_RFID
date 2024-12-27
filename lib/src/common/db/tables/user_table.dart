import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get userId => integer().autoIncrement()();
  TextColumn get username => text()();
  TextColumn get password => text()();
  TextColumn get email => text().nullable()();
  @ReferenceName('UserTable')
  DateTimeColumn get createdDate => dateTime()();
  @ReferenceName('UserTable')
  IntColumn get createdBy => integer()();
  @ReferenceName('UserTable')
  DateTimeColumn get updatedDate => dateTime()();
  @ReferenceName('UserTable')
  IntColumn get updatedBy => integer()();
}