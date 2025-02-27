import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/common/domain/return_response.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/extensions/theme_extension.dart';
import 'package:techbiz_rfid/src/common/widgets/async_value_widget.dart';
import 'package:techbiz_rfid/src/common/widgets/general_appbar.dart';
import 'package:techbiz_rfid/src/common/widgets/general_popup_error.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';
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
  void initState() {
    super.initState();
    _initializeSetting();
  }

  Future _initializeSetting() async {
    final scannerSettingState = ref.read(scannerSettingStateProvider.notifier);
    await scannerSettingState.setDefaultSetting();
  }

  Future<void> _showErrorDialog(
      BuildContext context, String title, String content) {
    return showDialog(
        context: context,
        builder: (context) {
          return GeneralPopUpError(title: title, content: content);
        });
  }

  @override
  Widget build(BuildContext context) {
    final successSnackbar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text(context.translation.settingSavedSuccessfully),
      action: SnackBarAction(
        label: context.translation.okTxt,
        onPressed: () {},
      ),
    );
    final List<String> languageList = ['English', 'Thai'];
    final List<FrequencyArea> frequencyAreaList = [
      FrequencyArea.RG_NONE,
      FrequencyArea.RG_EU,
      FrequencyArea.RG_EU2,
      FrequencyArea.RG_EU3,
      FrequencyArea.RG_KR,
      FrequencyArea.RG_NA,
      FrequencyArea.RG_PRC,
    ];
    final scannerSettingState = ref.watch(scannerSettingStateProvider);
    final scannerSettingButtonState =
        ref.watch(scannerSettingButtonStateProvider);
    final children = buildSettingItem(
      context,
      ref,
      settingItem: [
        SettingItem(
          header: context.translation.languageSetting,
          title: context.translation.language,
          content: DropdownButton<String>(
            value: scannerSettingState.language,
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
                    Slider(
                      value: scannerSettingState.readPower.toDouble(),
                      secondaryTrackValue: 0,
                      onChanged: (d) => ref
                          .read(scannerSettingStateProvider.notifier)
                          .updateReadPower(
                            d.toInt(),
                          ),
                      min: 0,
                      max: 33,
                    ),
                    Text(scannerSettingState.readPower.round().toString()),
                  ],
                ),
                Column(
                  children: [
                    Text(context.translation.writePowerSetting),
                    Slider(
                      value: scannerSettingState.writePower.toDouble(),
                      secondaryTrackValue: 0,
                      onChanged: (d) => ref
                          .read(scannerSettingStateProvider.notifier)
                          .updateWritePower(
                            d.toInt(),
                          ),
                      min: 0,
                      max: 33,
                    ),
                    Text(
                      scannerSettingState.writePower.round().toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SettingItem(
          header: context.translation.frequencyAreaSetting,
          title: context.translation.frequencyAreaSettingDescription,
          content: DropdownButton<FrequencyArea>(
            value: scannerSettingState.frequencyArea,
            items: frequencyAreaList
                .map<DropdownMenuItem<FrequencyArea>>((FrequencyArea val) {
              return DropdownMenuItem<FrequencyArea>(
                value: val,
                child: Text(val.name),
              );
            }).toList(),
            onChanged: (d) => ref
                .read(scannerSettingStateProvider.notifier)
                .updatefrequencyArea(d!),
          ),
        ),
      ],
    );

    ref.listen(scannerSettingButtonStateProvider, (prev, next) {
      if (next.hasError && prev!.hasError) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
                await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return GeneralPopUpError(
                      title: context.translation.error,
                      content: next.error is ReturnResponse ? (next.error as ReturnResponse).message : next.error.toString(),
                      actions: [
                        OutlinedButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(context.translation.okTxt, style: context.theme.textTheme.bodyMedium),
                        )
                      ],
                    );
                  },
                );
              });
      }
    });

    return GeneralAppBar(
      appbarTitle: context.translation.scannerSetting,
      child: Column(
        children: [
          Column(
            children: children,
          ),
          AsyncValueWidget(
            value: scannerSettingButtonState,
            data: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: () async {
                    await ref
                        .read(scannerSettingButtonStateProvider.notifier)
                        .onPressed();

                    if (scannerSettingButtonState.hasValue && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
                    }
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.floppyDisk,
                  ),
                  label: Text(context.translation.save),
                ),
              ),
            ),
            error: (e,st) => SizedBox(),
          ),
        ],
      ),
    );
  }
}
