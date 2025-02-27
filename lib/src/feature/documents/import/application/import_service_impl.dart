import 'package:excel/excel.dart';
import 'package:techbiz_rfid/src/common/wrapper/excel_wrapper.dart';
import 'package:techbiz_rfid/src/common/wrapper/file_picker_wrapper.dart';
import 'package:techbiz_rfid/src/feature/documents/import/domain/interface/import_repository.dart';
import 'package:techbiz_rfid/src/feature/documents/import/domain/interface/import_service.dart';
import 'package:techbiz_rfid/src/feature/documents/import/domain/stock_info.dart';

class ImportServiceImpl implements ImportService {
  final FilePickerWrapper filePicker;
  final ExcelWrapper excel;
  final ImportRepository importRepository;

  const ImportServiceImpl(
      {required this.filePicker,
      required this.excel,
      required this.importRepository});

  @override
  Future<List<StockImportInfo>> pickExcelFile() async {
    var _file = await filePicker.pickFile();
    if (_file != null) {
      var fileBytes = await _file.readAsBytes();
      var excelFile = excel.readExcel(fileBytes);

      var stockInfo = _getStockInfo(excelFile);
      return stockInfo;
    }

    return List.empty();
  }

  @override
  Future<void> importData(List<StockImportInfo> stockInfo) async {
    await importRepository.insertImportDataFromExcel(stockInfo);
  }

  List<StockImportInfo> _getStockInfo(Excel excelFile) {
    List<StockImportInfo> _stockInfo = [];

    for (var sheet in excelFile.sheets.keys) {
      for (var row in excelFile.sheets[sheet]!.rows) {
        if (row[0]!.cellIndex.rowIndex == 0) {
          continue;
        }

        TextCellValue _productCode = row[0]!.value as TextCellValue;
        TextCellValue _productName = row[1]!.value as TextCellValue;
        TextCellValue _productSerial = row[2]!.value as TextCellValue;
        IntCellValue _productPrice = row[3]!.value as IntCellValue;
        IntCellValue _quantity = row[4]!.value as IntCellValue;

        var result = StockImportInfo(
          productCode: _productCode.value.toString(),
          productName: _productName.value.toString(),
          productSerial: _productSerial.value.toString(),
          price: _productPrice.value,
          quantity: _quantity.value,
        );
        _stockInfo.add(result);
      }
    }
    return _stockInfo;
  }
}
