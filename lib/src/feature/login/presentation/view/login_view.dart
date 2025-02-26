import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/generated/assets.gen.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/extensions/theme_extension.dart';
import 'package:techbiz_rfid/src/common/route/app_routes_const.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.design.tempLogo.path),
              SizedBox(height: 50),
              TextFormField(
                initialValue: 'admin',
                style: context.theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 50),
              TextFormField(
                initialValue: 'password',
                style: context.theme.textTheme.bodyMedium,
                obscureText: true,
              ),
              SizedBox(height: 50),
              ElevatedButton.icon(
                icon: FaIcon(FontAwesomeIcons.rightToBracket),
                label: Text(context.translation.login),
                onPressed: () => context.go(AppRoutesConst.home),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: FaIcon(FontAwesomeIcons.hashtagLock),
                label: Text(context.translation.loginWithPin),
                onPressed: () => context.go(AppRoutesConst.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
