import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/route/app_routes_const.dart';
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
            title: context.translation.scannerSetting,
            icon: FontAwesomeIcons.gear,
            onTap: () => context.go(AppRoutesConst.scannerSetting),
          ),
        ],
      )),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainMenuItem(
                  icon: FontAwesomeIcons.fileImport,
                  title: "Import Data",
                  onPressed: () => context.go(AppRoutesConst.import),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.warehouse,
                  title: "Scanner",
                  onPressed: () => context.go(AppRoutesConst.scanner),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.fileExport,
                  title: "Export Data",
                  onPressed: () => context.go(AppRoutesConst.export),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainMenuItem(
                  icon: FontAwesomeIcons.penToSquare,
                  title: "Read/Write Tag",
                  onPressed: () => context.go(AppRoutesConst.import),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.lock,
                  title: "Lock Tag",
                  onPressed: () => context.go(AppRoutesConst.scanner),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.trashSlash,
                  title: "Kill Tag",
                  onPressed: () => context.go(AppRoutesConst.export),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kDebugMode
                    ? MainMenuItem(
                        icon: FontAwesomeIcons.user,
                        title: context.translation.login,
                        onPressed: () => context.go(AppRoutesConst.login),
                      )
                    : SizedBox(),
              ],
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
  final VoidCallback onPressed;

  const MainMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        children: [
        IconButton.outlined(
          icon: FaIcon(icon),
          onPressed: onPressed,
        ),
        Text(title),
      ]),
    );
  }
}
