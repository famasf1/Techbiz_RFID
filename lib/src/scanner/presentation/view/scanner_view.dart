import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/widgets/async_value_widget.dart';
import 'package:techbiz_rfid/src/scanner/domain/enum/scan_code_enum.dart';
import 'package:techbiz_rfid/src/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/scanner/presentation/state/scanner_state.dart';

class ScannerView extends ConsumerStatefulWidget {
  const ScannerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerViewState();
}

class _ScannerViewState extends ConsumerState<ScannerView> {
  static const platform = MethodChannel('com.techbusiness.hardware_button');

  @override
  void initState() {
    super.initState();
    _initializeServiceInstance();
    // platform.setMethodCallHandler((call) async {
    //   if (call.method == "onScanKeyPressed") {
    //     final int keyCode = call.arguments;
    //     print("Key ${keyCode}");
    //   }
    // });
  }

  Future<void> _initializeServiceInstance() async {
    final scannerService = ref.read(scannerServiceProvider);

    await scannerService.getInstance();
    await scannerService.listenScannerButtonClick();
  }

  @override
  Widget build(BuildContext context) {
    bool isStart = false;
    final scanDataState = ref.watch(scanDataStateProvider);
    final scannerService = ref.watch(scannerServiceProvider);
    final scanButtonState = ref.watch(scanButtonStateProvider);

    Future<void> showHardwareVersion() async {
      final hardwareInfo = await scannerService.getHardwareVersion();

      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Hardware Version"),
              content: Text(hardwareInfo.hardware ?? "No Data"),
            );
          },
        );
      }
    }

    scannerService.startListening((data) async {
      ScanCode? scanCode = ScanCode.fromKeyCode(data);
      
      switch (scanCode) {
        case ScanCode.leftSide:
          await showHardwareVersion();
        case ScanCode.trigger:
          ref.read(scanButtonStateProvider.notifier).onPressed();
        case ScanCode.rightSide:
          debugPrint("Right Side");
        default:
          debugPrint("Unknown");
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: AsyncValueWidget(
                value: scanDataState,
                data: (scanData) => DataTable(
                  border: TableBorder.all(),
                  columns: [
                    DataColumn(
                      label: Text("Product Code"),
                      numeric: false,
                      onSort: (index, asc) => 0,
                    ),
                    DataColumn(
                      label: Text("Product Name"),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text("Product Serial"),
                      numeric: false,
                      onSort: (i, j) => 0,
                    ),
                    DataColumn(
                      label: Text("Product Price"),
                      numeric: true,
                      onSort: (i, j) => 0,
                    ),
                    DataColumn(
                      label: Text("Product Quantity"),
                      numeric: true,
                      onSort: (index, asc) {
                        if (asc) {
                          return scanData
                              .sort((a, b) => a.quantity.compareTo(b.quantity));
                        } else {
                          return scanData
                              .sort((a, b) => b.quantity.compareTo(a.quantity));
                        }
                      },
                    ),
                  ],
                  dataRowMaxHeight: double.infinity,
                  rows: [
                    ...scanData.map(
                      (stockInfo) {
                        return DataRow(
                          cells: [
                            DataCell(Text(stockInfo.productCode)),
                            DataCell(Text(stockInfo.productName)),
                            DataCell(Text(stockInfo.productSerial)),
                            DataCell(Text(stockInfo.price.toString())),
                            DataCell(Text(stockInfo.quantity.toString())),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: scanButtonState,
              replacement: FilledButton(
                onPressed: () async {
                  await scannerService.startScanning();
                  ref.read(scanButtonStateProvider.notifier).onPressed();
                },
                child: Text("Start Scanning"),
              ),
              child: FilledButton(
                onPressed: () async {
                  await scannerService.stopScanning();
                  ref.read(scanButtonStateProvider.notifier).onPressed();
                },
                child: Text("Stop Scanning"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() async {
    await ref.read(scannerServiceProvider).stopListenScannerButtonClick();
    super.dispose();
  }
}
