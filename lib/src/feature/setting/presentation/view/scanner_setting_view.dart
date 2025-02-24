import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/widgets/general_appbar.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/widget/setting_item.dart';
import 'package:techbiz_rfid/src/feature/setting/presentation/state/scanner_setting_state.dart';
import 'package:techbiz_rfid/src/feature/setting/presentation/widget/setting_item.dart';

class ScannerSettingView extends ConsumerStatefulWidget {
  const ScannerSettingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScannerSettingViewState();
}

class _ScannerSettingViewState extends ConsumerState<ScannerSettingView> {
  @override
  Widget build(BuildContext context) {
    final List<String> languageList = ['English', 'Thai'];
    final scannerSettingState = ref.watch(scannerSettingStateProvider);
    final children = buildSettingItem(
      context,
      ref,
      settingItem: [
        SettingItem(
          header: context.translation.languageSetting,
          title: context.translation.language,
          content: DropdownButton<String>(
            items: languageList.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            }).toList(),
            onChanged: (String? value) {
              ref
                  .read(scannerSettingStateProvider.notifier)
                  .updateLanguage(value!);
            },
          ),
        ),
        SettingItem(
          header: context.translation.powerSetting,
          title: context.translation.powerSetting,
          content: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Text(context.translation.readPowerSetting),
                    Slider(value: 0, secondaryTrackValue: 0, onChanged: (d) {}),
                  ],
                ),
                Column(
                  children: [
                    Text(context.translation.writePowerSetting),
                    Slider(value: 0, secondaryTrackValue: 0, onChanged: (d) {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return GeneralAppBar(
      appbarTitle: context.translation.scannerSetting,
      child: Column(
        children: children,
      ),
    );
  }
}
