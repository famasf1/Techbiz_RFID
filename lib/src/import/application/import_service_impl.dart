import 'package:archive/archive_io.dart';
import 'package:techbiz_rfid/src/common/wrapper/excel_wrapper.dart';
import 'package:techbiz_rfid/src/common/wrapper/file_picker_wrapper.dart';
import 'package:techbiz_rfid/src/import/domain/interface/import_service.dart';

class ImportServiceImpl implements ImportService {
  final FilePickerWrapper filePicker;
  final ExcelWrapper excel;

  const ImportServiceImpl({required this.filePicker, required this.excel});

  @override
  Future<void> pickExcelFile() async {
    var _file = await filePicker.pickFile();
    if (_file != null) {
      var fileBytes = InputStream(_file.openRead());
      var excelFile = excel.readExcel(fileBytes);

      for (var table in excelFile.tables.keys) {
        for (var row in excelFile.tables[table]!.rows) {
          for (var cell in row) {
            if (cell!.rowIndex == 0) {
              continue;
            }

            print(cell.value);
          }
        }
      }
    }
  }
}
