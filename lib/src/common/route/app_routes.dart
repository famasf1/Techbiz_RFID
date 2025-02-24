import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/feature/export/presentation/view/export_view.dart';
import 'package:techbiz_rfid/src/feature/home/presentation/view/homepage_view.dart';
import 'package:techbiz_rfid/src/feature/import/presentation/views/import_view.dart';
import 'package:techbiz_rfid/src/feature/scanner/presentation/view/scanner_view.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) =>
          HomepageView(title: 'Flutter Scanner Demo Home Page'),
      routes: [
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
      ],
    ),
  ],
);
