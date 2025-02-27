import 'package:drift/drift.dart';
import 'package:techbiz_rfid/src/common/db/app_database.dart';
import 'package:techbiz_rfid/src/feature/documents/import/domain/interface/import_repository.dart';
import 'package:techbiz_rfid/src/feature/documents/import/domain/stock_info.dart';

class ImportRepositoryImpl implements ImportRepository {
  final AppDatabase appDatabase;

  const ImportRepositoryImpl({required this.appDatabase});

  @override
  Future<void> insertImportDataFromExcel(List<StockImportInfo> stockInfo) async {
    List<StockViewCompanion> stockData = stockInfo.map((stockImportInfo) {
      return StockViewCompanion(
          productCode: Value(stockImportInfo.productCode),
          productName: Value(stockImportInfo.productName),
          price: Value(stockImportInfo.price),
          quantity: Value(stockImportInfo.quantity),);
    }).toList();

    await appDatabase.stockView.insertAll(stockData);
  }
}
