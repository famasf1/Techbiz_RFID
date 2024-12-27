import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomepageView extends ConsumerStatefulWidget {
  final String title;

  const HomepageView({super.key, required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageViewState();
}

class _HomepageViewState extends ConsumerState<HomepageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}