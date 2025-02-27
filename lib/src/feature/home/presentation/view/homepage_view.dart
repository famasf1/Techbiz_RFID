import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/route/app_routes_const.dart';
import 'package:techbiz_rfid/src/common/widgets/drawer_item.dart';
import 'package:techbiz_rfid/src/feature/home/presentation/widget/main_menu_item.dart';

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
                  title: context.translation.importData,
                  onPressed: () => context.go(AppRoutesConst.import),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.warehouse,
                  title: context.translation.scanner,
                  onPressed: () => context.go(AppRoutesConst.scanner),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.fileExport,
                  title: context.translation.exportData,
                  onPressed: () => context.go(AppRoutesConst.export),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainMenuItem(
                  icon: FontAwesomeIcons.penToSquare,
                  title: context.translation.readWriteTag,
                  onPressed: () => context.go(AppRoutesConst.editTag),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.lock,
                  title: context.translation.lockTag,
                  onPressed: () => context.go(AppRoutesConst.scanner),
                ),
                MainMenuItem(
                  icon: FontAwesomeIcons.trashSlash,
                  title: context.translation.killTag,
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
