import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/export/presentation/view/export_view.dart';
import 'package:techbiz_rfid/src/home/presentation/view/homepage_view.dart';
import 'package:techbiz_rfid/src/import/presentation/views/import_view.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) =>
          HomepageView(title: 'Flutter Scanner Demo Home Page'),
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
  ],
);
