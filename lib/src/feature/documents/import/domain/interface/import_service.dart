import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/wrapper/excel_wrapper.dart';
import 'package:techbiz_rfid/src/common/wrapper/file_picker_wrapper.dart';
import 'package:techbiz_rfid/src/feature/documents/import/application/import_service_impl.dart';
import 'package:techbiz_rfid/src/feature/documents/import/domain/interface/import_repository.dart';
import 'package:techbiz_rfid/src/feature/documents/import/domain/stock_info.dart';

part 'import_service.g.dart';

@riverpod
ImportService importService(Ref ref) {
  final filePickerWrapper = ref.watch(filePickerWrapperProvider);
  final excelWrapper = ref.watch(excelWrapperProvider);
  final importRepository = ref.watch(importRepositoryProvider);

  return ImportServiceImpl(filePicker: filePickerWrapper, excel: excelWrapper, importRepository: importRepository);
}

abstract class ImportService {
  Future<List<StockImportInfo>> pickExcelFile();
  Future<void> importData(List<StockImportInfo> stockInfo);
}
