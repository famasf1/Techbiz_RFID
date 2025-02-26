// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get app_name => 'TECHBIZ RFID';

  @override
  String get home => 'หน้าแรก';

  @override
  String get scanner => 'สแกนเนอร์';

  @override
  String get scannerSetting => 'ตั้งค่าเครื่องสแกน';

  @override
  String get save => 'บันทึก';

  @override
  String get error => 'ข้อผิดพลาด';

  @override
  String get okTxt => 'ตกลง';

  @override
  String get login => 'เข้าสู่ระบบ';

  @override
  String get importData => 'นำเข้าข้อมูล';

  @override
  String get exportData => 'ส่งออกข้อมูล';

  @override
  String get readWriteTag => 'อ่าน/แก้ไข Tag';

  @override
  String get lockTag => 'ล็อค Tag';

  @override
  String get killTag => 'ทำลาย Tag';

  @override
  String get loginWithPin => 'เข้าสู่ระบบด้วย PIN';

  @override
  String get loginWithPinDescription => 'โปรดกรอกหมายเลข PIN เพื่อเข้าสู่ระบบ';

  @override
  String get languageSetting => 'ตั้งค่าภาษา';

  @override
  String get language => 'ภาษา';

  @override
  String get powerSetting => 'ตั้งค่าระยะพื้นที่สแกน';

  @override
  String get readPowerSetting => 'ระยะพื้นที่ในการอ่าน';

  @override
  String get readPowerSettingDescription => 'แนะนำให้ตั้งไว้ที่ประมาณ 25–30 dBm';

  @override
  String get writePowerSetting => 'ระยะพื้นที่ในการเขียน';

  @override
  String get writePowerSettingDescription => 'แนะนำให้ตั้งไว้ที่ประมาณ 20–25 dBm';

  @override
  String get frequencyAreaSetting => 'ชุดคลื่นความถี่';

  @override
  String get frequencyAreaSettingDescription => 'เลือกคลื่นความถี่ที่ต้องการใช้ (MHz)';
}
