import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/import/domain/interface/import_service.dart';
import 'package:techbiz_rfid/src/import/domain/stock_info.dart';

part 'import_state.g.dart';

@riverpod
class ImportDataState extends _$ImportDataState {
  @override
  List<StockImportInfo> build() {
    return List.empty();
  }

  Future<void> getImportData() async {
    final importService = ref.watch(importServiceProvider);

    state = await importService.pickExcelFile();
  }
}
