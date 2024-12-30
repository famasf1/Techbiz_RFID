import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerItem extends ConsumerWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
