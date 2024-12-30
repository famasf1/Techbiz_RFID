import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'excel_wrapper.g.dart';

@riverpod
ExcelWrapper excelWrapper(Ref ref) => ExcelWrapper();

class ExcelWrapper {
  Excel readExcel(Uint8List fileBytes) => Excel.decodeBytes(fileBytes);
}
