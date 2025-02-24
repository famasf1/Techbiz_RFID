import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class GeneralAppBar extends ConsumerWidget {
  final Widget child;
  final String appbarTitle;
  const GeneralAppBar(
      {super.key, required this.child, required this.appbarTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: child,
    );
  }
}
