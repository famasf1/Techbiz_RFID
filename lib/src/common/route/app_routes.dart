import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/feature/export/presentation/view/export_view.dart';
import 'package:techbiz_rfid/src/feature/home/presentation/view/homepage_view.dart';
import 'package:techbiz_rfid/src/feature/import/presentation/views/import_view.dart';
import 'package:techbiz_rfid/src/feature/login/presentation/view/login_view.dart';
import 'package:techbiz_rfid/src/feature/scanner/presentation/view/scanner_view.dart';
import 'package:techbiz_rfid/src/feature/setting/presentation/view/scanner_setting_view.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'firstPage',
      path: '/',
      builder: (context, state) =>
          kDebugMode ? HomepageView(title: 'Flutter Scanner Demo') : LoginView(),
      routes: [
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => HomepageView(title: 'Flutter Scanner Demo'),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          name: 'import',
          path: '/import',
          builder: (context, state) => ImportView(),
        ),
        GoRoute(
          name: 'export',
          path: '/export',
          builder: (context, state) => ExportView(),
        ),
        GoRoute(
          name: 'scanner',
          path: '/scanner',
          builder: (context, state) => ScannerView(),
        ),
        GoRoute(
          name: 'scannerSetting',
          path: '/scannerSetting',
          builder: (context, state) => ScannerSettingView(),
        ),
      ],
    ),
  ],
);
