import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImportView extends ConsumerStatefulWidget {
  const ImportView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImportViewState();
}

class _ImportViewState extends ConsumerState<ImportView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Import Data"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text("Import Data"),
              ElevatedButton(
                onPressed: () {},
                child: Text("Import Data"),
              ),
            ],
          )
        ],
      ),
    );
  }
}