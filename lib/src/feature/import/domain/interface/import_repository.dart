import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/db/app_database.dart';
import 'package:techbiz_rfid/src/feature/import/data/import_repository_impl.dart';
import 'package:techbiz_rfid/src/feature/import/domain/stock_info.dart';

part 'import_repository.g.dart';

@riverpod 
ImportRepository importRepository(Ref ref) {
  final appDb = ref.watch(appDatabaseProvider);

  return ImportRepositoryImpl(appDatabase: appDb);
}

abstract class ImportRepository {
  Future<void> insertImportDataFromExcel(List<StockImportInfo> stockInfo);
}
