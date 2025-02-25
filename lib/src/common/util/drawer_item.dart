import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem extends ConsumerWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  const DrawerItem({super.key, required this.title, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      leading: FaIcon(icon),
    );
  }
}
