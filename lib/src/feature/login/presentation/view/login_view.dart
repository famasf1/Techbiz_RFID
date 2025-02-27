import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:techbiz_rfid/generated/assets.gen.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/extensions/theme_extension.dart';
import 'package:techbiz_rfid/src/common/route/app_routes_const.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final pinSnackBar = SnackBar(
      duration: Duration(minutes: 1),
      content: Pinput(
        autofocus: true,
        onTapOutside: (event) => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        controller: TextEditingController(),
        onCompleted: (val) => context.go(AppRoutesConst.home),
        obscureText: true,
        errorText: context.translation.loginWithPinDescription,
      ),
    ); //Text(context.translation.loginWithPinDescription));

    return Scaffold(
      body: SingleChildScrollView(
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
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(pinSnackBar),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
