import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_th.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('th')
  ];

  /// The name of the app
  ///
  /// In en, this message translates to:
  /// **'TECHBIZ RFID'**
  String get app_name;

  /// The title of the home page
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// The title of the scanner page
  ///
  /// In en, this message translates to:
  /// **'Scanner'**
  String get scanner;

  /// The title of the scanner setting page
  ///
  /// In en, this message translates to:
  /// **'Scanner Setting'**
  String get scannerSetting;

  /// The title for save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// The title for error
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Okay button
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okTxt;

  /// The title for login
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// The title for import data
  ///
  /// In en, this message translates to:
  /// **'Import Data'**
  String get importData;

  /// The title for export data
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// The title for read/write tag
  ///
  /// In en, this message translates to:
  /// **'Read/Write Tag'**
  String get readWriteTag;

  /// The title for lock tag
  ///
  /// In en, this message translates to:
  /// **'Lock Tag'**
  String get lockTag;

  /// The title for kill tag
  ///
  /// In en, this message translates to:
  /// **'Kill Tag'**
  String get killTag;

  /// The title for login with pin
  ///
  /// In en, this message translates to:
  /// **'Login with Pin'**
  String get loginWithPin;

  /// The description for login with pin
  ///
  /// In en, this message translates to:
  /// **'Please enter the pin code to login'**
  String get loginWithPinDescription;

  /// The title for language setting
  ///
  /// In en, this message translates to:
  /// **'Language Setting'**
  String get languageSetting;

  /// The title for language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// The title for power setting
  ///
  /// In en, this message translates to:
  /// **'Power Setting'**
  String get powerSetting;

  /// The title for read power setting
  ///
  /// In en, this message translates to:
  /// **'Read Power'**
  String get readPowerSetting;

  /// Description helper for read power setting
  ///
  /// In en, this message translates to:
  /// **'25–30 dBm is generally recommended setting.'**
  String get readPowerSettingDescription;

  /// The title for write power setting
  ///
  /// In en, this message translates to:
  /// **'Write Power'**
  String get writePowerSetting;

  /// Description helper for write power setting
  ///
  /// In en, this message translates to:
  /// **'20–25 dBm is generally recommended setting.'**
  String get writePowerSettingDescription;

  /// The title for frequency area setting
  ///
  /// In en, this message translates to:
  /// **'Frequency Area'**
  String get frequencyAreaSetting;

  /// Description helper for frequency area setting
  ///
  /// In en, this message translates to:
  /// **'Select the frequency area you want to use (MHz).'**
  String get frequencyAreaSettingDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'th'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'th': return AppLocalizationsTh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
