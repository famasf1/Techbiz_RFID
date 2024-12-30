import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/wrapper/excel_wrapper.dart';
import 'package:techbiz_rfid/src/common/wrapper/file_picker_wrapper.dart';
import 'package:techbiz_rfid/src/import/application/import_service_impl.dart';

part 'import_service.g.dart';

@riverpod
ImportService importService(Ref ref) {
  final filePickerWrapper = ref.watch(filePickerWrapperProvider);
  final excelWrapper = ref.watch(excelWrapperProvider);

  return ImportServiceImpl(filePicker: filePickerWrapper, excel: excelWrapper);
}

abstract class ImportService {
  Future<void> pickExcelFile();
}
