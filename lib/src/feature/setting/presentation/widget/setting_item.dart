import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/extensions/theme_extension.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/widget/setting_item.dart';

List<Widget> buildSettingItem(
  BuildContext context,
  WidgetRef ref, {
  required List<SettingItem> settingItem,
}) {
  return settingItem.expand((v) {
    return [
      _SettingHeader(
        translation: v.header,
      ),
      _SettingContent(
        title: v.title,
        child: v.content,
      ),
      _SettingItemDivider(),
    ];
  }).toList();
}

class _SettingHeader extends ConsumerWidget {
  const _SettingHeader({
    required this.translation,
  });

  final String translation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        translation,
        style: context.theme.textTheme.headlineMedium,
      ),
    );
  }
}

class _SettingContent extends ConsumerWidget {
  final Widget child;
  final String title;
  const _SettingContent({required this.child, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: context.theme.textTheme.bodyMedium,
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _SettingItemDivider extends ConsumerWidget {
  const _SettingItemDivider();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Divider(
      height: 1,
      color: context.theme.colorScheme.outline,
      thickness: 1,
    );
  }
}
