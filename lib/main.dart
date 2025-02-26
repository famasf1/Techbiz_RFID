import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/generated/app_localizations.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/route/app_routes.dart';
import 'package:techbiz_rfid/src/common/theme/techbiz_theme.dart';
import 'package:techbiz_rfid/src/common/wrapper/share_prefs_wrapper.dart';
import 'package:techbiz_rfid/src/feature/scanner/domain/interface/scanner_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageState = ref.watch(languageStateProvider);

    return _EagerInitialization(
      child: MaterialApp.router(
        routerConfig: appRoutes,
        title: 'TECHBIZ_RFID',
        theme: MaterialTechbizTheme().themeData,
        locale: Locale(languageState),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sharePrefsWrapperProvider);
    ref.watch(scannerAudioPoolProvider);

    return child;
  }
}
