import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/common/route/app_routes_const.dart';
import 'package:techbiz_rfid/src/feature/documents/export/presentation/view/export_view.dart';
import 'package:techbiz_rfid/src/feature/home/presentation/view/homepage_view.dart';
import 'package:techbiz_rfid/src/feature/documents/import/presentation/views/import_view.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/presentation/view/edit_tag_view.dart';
import 'package:techbiz_rfid/src/feature/login/presentation/view/login_view.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/presentation/view/scanner_view.dart';
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
          path: AppRoutesConst.home,
          builder: (context, state) => HomepageView(title: 'Flutter Scanner Demo'),
        ),
        GoRoute(
          name: 'login',
          path: AppRoutesConst.login,
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          name: 'import',
          path: AppRoutesConst.import,
          builder: (context, state) => ImportView(),
        ),
        GoRoute(
          name: 'export',
          path: AppRoutesConst.export,
          builder: (context, state) => ExportView(),
        ),
        GoRoute(
          name: 'scanner',
          path: AppRoutesConst.scanner,
          builder: (context, state) => ScannerView(),
        ),
        GoRoute(
          name: 'scannerSetting',
          path: AppRoutesConst.scannerSetting,
          builder: (context, state) => ScannerSettingView(),
        ),
        GoRoute(
          name: 'editTag',
          path: AppRoutesConst.editTag,
          builder: (context, state) => EditTagView(),
        ),
      ],
    ),
  ],
);
