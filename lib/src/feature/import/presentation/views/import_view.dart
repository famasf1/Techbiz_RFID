import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/feature/import/domain/interface/import_service.dart';
import 'package:techbiz_rfid/src/feature/import/presentation/state/import_state.dart';

class ImportView extends ConsumerStatefulWidget {
  const ImportView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImportViewState();
}

class _ImportViewState extends ConsumerState<ImportView> {
  @override
  Widget build(BuildContext context) {
    final importData = ref.watch(importDataStateProvider);
    final importService = ref.watch(importServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Import Data"),
      ),
      body: Visibility(
        visible: importData.isEmpty,
        replacement: Column(
          children: [
            ImportPreviewTable(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FilledButton(
                onPressed: () async =>
                    await importService.importData(importData),
                child: Text("Import"),
              ),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Import Data"),
              ElevatedButton(
                onPressed: () async => await ref
                    .read(importDataStateProvider.notifier)
                    .getImportData(),
                child: Text("Import Data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImportPreviewTable extends ConsumerStatefulWidget {
  const ImportPreviewTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportPreviewTableState();
}

class _ImportPreviewTableState extends ConsumerState<ImportPreviewTable> {
  @override
  Widget build(BuildContext context) {
    final importData = ref.watch(importDataStateProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
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
              onSort: (index, asc) => ref.read(importDataStateProvider.notifier).sort(index, asc)
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
                  return importData.sort((a, b) => a.quantity.compareTo(b.quantity));
                } else {
                  return importData.sort((a, b) => b.quantity.compareTo(a.quantity));
                }
              },
            ),
          ],
          dataRowMaxHeight: double.infinity,
          rows: [
            ...importData.map(
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
    );
  }
}
