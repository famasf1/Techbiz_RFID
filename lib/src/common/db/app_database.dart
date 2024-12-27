import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:techbiz_rfid/src/common/db/tables/user_table.dart';
import 'package:techbiz_rfid/src/common/db/tables/stock_view_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [StockView, User])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: "techbiz_rfid.db");
  }
}
