// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'TECHBIZ RFID';

  @override
  String get home => 'Home';

  @override
  String get scanner => 'Scanner';

  @override
  String get scannerSetting => 'Scanner Setting';

  @override
  String get save => 'Save';

  @override
  String get error => 'Error';

  @override
  String get okTxt => 'Okay';

  @override
  String get login => 'Login';

  @override
  String get importData => 'Import Data';

  @override
  String get exportData => 'Export Data';

  @override
  String get readWriteTag => 'Read/Write Tag';

  @override
  String get lockTag => 'Lock Tag';

  @override
  String get killTag => 'Kill Tag';

  @override
  String get loginWithPin => 'Login with Pin';

  @override
  String get loginWithPinDescription => 'Please enter the pin code to login';

  @override
  String get languageSetting => 'Language Setting';

  @override
  String get language => 'Language';

  @override
  String get powerSetting => 'Power Setting';

  @override
  String get readPowerSetting => 'Read Power';

  @override
  String get readPowerSettingDescription => '25–30 dBm is generally recommended setting.';

  @override
  String get writePowerSetting => 'Write Power';

  @override
  String get writePowerSettingDescription => '20–25 dBm is generally recommended setting.';

  @override
  String get frequencyAreaSetting => 'Frequency Area';

  @override
  String get frequencyAreaSettingDescription => 'Select the frequency area you want to use (MHz).';

  @override
  String get settingSavedSuccessfully => 'Setting saved successfully';
}
