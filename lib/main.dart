import 'package:flutter/material.dart';
import 'package:techbiz_rfid/src/common/theme/techbiz_theme.dart';
import 'package:techbiz_rfid/src/home/presentation/view/homepage_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TECHBIZ_RFID',
      theme: MaterialTechbizTheme().themeData,
      home: const HomepageView(title:'Flutter Demo Home Page'),
    );
  }
}

