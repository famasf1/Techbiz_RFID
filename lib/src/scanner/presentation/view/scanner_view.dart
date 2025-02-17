import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/scanner/presentation/state/scanner_state.dart';

class ScannerView extends ConsumerWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanDataState = ref.watch(scanDataStateProvider);
    final scannerService = ref.watch(scannerServiceProvider);

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
              child: DataTable(
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
                        return scanDataState
                            .sort((a, b) => a.quantity.compareTo(b.quantity));
                      } else {
                        return scanDataState
                            .sort((a, b) => b.quantity.compareTo(a.quantity));
                      }
                    },
                  ),
                ],
                dataRowMaxHeight: double.infinity,
                rows: [
                  ...scanDataState.map(
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
            FilledButton(
              onPressed: () {},
              child: Text("Start Scanning"),
            ),
          ],
        ),
      ),
    );
  }
}
