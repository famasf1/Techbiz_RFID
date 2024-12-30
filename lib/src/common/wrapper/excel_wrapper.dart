import 'package:excel/excel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:archive/archive.dart';

part 'excel_wrapper.g.dart';

@riverpod
ExcelWrapper excelWrapper(Ref ref) => ExcelWrapper();

class ExcelWrapper {
  Excel readExcel(InputStream fileBytes) => Excel.decodeBuffer(fileBytes);
}
