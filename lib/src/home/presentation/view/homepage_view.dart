import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/util/drawer_item.dart';

class HomepageView extends ConsumerStatefulWidget {
  final String title;

  const HomepageView({super.key, required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageViewState();
}

class _HomepageViewState extends ConsumerState<HomepageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: SizedBox(
              child: Text('Menu'),
            ),
          ),
          DrawerItem(
            title: "Import Data",
            onTap: () {},
          ),
          DrawerItem(
            title: "Export Data",
            onTap: () {},
          ),
        ],
      )),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainMenuItem(
              icon: Icons.import_contacts,
              title: "Import Data",
            ),
            MainMenuItem(
              icon: Icons.warehouse, 
              title: "Scanner"),
            MainMenuItem(
              icon: Icons.import_export,
              title: "Export Data",
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const MainMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      IconButton.outlined(        
        icon: Icon(icon),
        onPressed: () {},
      ),
      Text(title),
    ]);
  }
}
