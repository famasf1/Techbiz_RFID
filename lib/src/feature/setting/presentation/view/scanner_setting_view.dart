import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/widgets/general_appbar.dart';
import 'package:techbiz_rfid/src/feature/setting/presentation/state/scanner_setting_state.dart';

class ScannerSettingView extends ConsumerStatefulWidget {
  const ScannerSettingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerSettingViewState();
}

class _ScannerSettingViewState extends ConsumerState<ScannerSettingView> {

  @override
  Widget build(BuildContext context) {
    final translation = context.localization;
    final List<String> languageList = ['English', 'Thai'];
    final scannerSettingState = ref.watch(scannerSettingStateProvider);

    return GeneralAppBar(
      appbarTitle: translation.scannerSetting,
      child: Column(
        children: [
          Text(translation.languageSetting),
          DropdownButton<String>(
            items: languageList.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            }).toList(), 
            onChanged: (String? value) {
              ref.read(scannerSettingStateProvider.notifier).updateLanguage(value!); 
            },
          ),
        ],
      ),
    );
  }
}