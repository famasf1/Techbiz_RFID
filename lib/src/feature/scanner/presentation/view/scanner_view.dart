import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/feature/scanner/domain/enum/scan_code_enum.dart';
import 'package:techbiz_rfid/src/feature/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/feature/scanner/presentation/state/scanner_state.dart';

class ScannerView extends ConsumerStatefulWidget {
  const ScannerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerViewState();
}

class _ScannerViewState extends ConsumerState<ScannerView> {

  @override
  void initState() {
    super.initState();
    _initializeServiceInstance();
  }

  Future<void> _initializeServiceInstance() async {
    final scannerService = ref.read(scannerServiceProvider);

    // final instanceRes = await scannerService.getInstance();
    // if (instanceRes.code == uhf6Plugin.Code.success) {
      await scannerService.listenScannerButtonClick();
    // }
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
      switch (data.eventType) {
        case EventChannelConst.scannerInputEvent:
          ScanCode? scanCode = ScanCode.fromKeyCode(data.payload as String);

          switch (scanCode) {
            case ScanCode.leftSide:
              await showHardwareVersion();
            case ScanCode.trigger:
              await ref.read(scanButtonStateProvider.notifier).onPressed();
            case ScanCode.rightSide:
              debugPrint("Right Side");
            default:
              debugPrint("Unknown");
          }
        case EventChannelConst.scannerTagInfoEvent:
          if (data.payload is List) {
            final tagInfoList = data.payload as List;
            if (tagInfoList.isNotEmpty) {
              ref.read(scanDataStateProvider.notifier).addData(tagInfoList);
            }
          }
        default:
          debugPrint("Unknown Event");
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: 
                  DataTable(
                      border: TableBorder.all(),
                      columns: [
                        DataColumn(
                          label: Text("Code"),
                          numeric: false,
                          onSort: (index, asc) => 0,
                        ),
                        // DataColumn(
                        //   label: Text("Quantity"),
                        //   numeric: false,
                        // ),
                        // DataColumn(
                        //   label: Text("Product Serial"),
                        //   numeric: false,
                        //   onSort: (i, j) => 0,
                        // ),
                        // DataColumn(
                        //   label: Text("Product Price"),
                        //   numeric: true,
                        //   onSort: (i, j) => 0,
                        // ),
                        DataColumn(
                          label: Text("Quantity"),
                          numeric: true,
                          // onSort: (index, asc) {
                          //   if (asc) {
                          //     return scanData.sort(
                          //         (a, b) => a.quantity.compareTo(b.quantity));
                          //   } else {
                          //     return scanData.sort(
                          //         (a, b) => b.quantity.compareTo(a.quantity));
                          //   }
                          // },
                        ),
                      ],
                      dataRowMaxHeight: double.infinity,
                      rows: [
                        ...scanDataState.map(
                          (stockInfo) {
                            return DataRow(
                              cells: [
                                DataCell(Text(stockInfo.epcId)),
                                // DataCell(Text(stockInfo.productName)),
                                // DataCell(Text(stockInfo.productSerial)),
                                // DataCell(Text(stockInfo.price.toString())),
                                DataCell(Text(stockInfo.antennaId.toString())),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: scanButtonState,
                replacement: FilledButton(
                  onPressed: () async {
                    await ref
                        .read(scanButtonStateProvider.notifier)
                        .onPressed();
                  },
                  child: Text("Start Scanning"),
                ),
                child: FilledButton(
                  onPressed: () async {
                    await ref
                        .read(scanButtonStateProvider.notifier)
                        .onPressed();
                  },
                  child: Text("Stop Scanning"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() async {
    super.dispose();
  }
}
