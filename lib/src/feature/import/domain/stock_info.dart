import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info.freezed.dart';

@freezed
class StockImportInfo with _$StockImportInfo {
  const factory StockImportInfo({
    required String productCode,
    required String productName,
    required String productSerial,
    required int price,
    required int quantity,
  }) = _StockInfo;
}
