import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/route/app_routes.dart';
import 'package:techbiz_rfid/src/common/theme/techbiz_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MainApp(),),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
      title: 'TECHBIZ_RFID',
      theme: MaterialTechbizTheme().themeData,
    );
  }
}

