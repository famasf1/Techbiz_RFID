class ScanData {
  final String productCode;
  final String productName;
  final String productSerial;
  final int price;
  final int quantity;

  const ScanData({
    required this.productCode,
    required this.productName,
    required this.productSerial,
    required this.price,
    required this.quantity,
  });
}