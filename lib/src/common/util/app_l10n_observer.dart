import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/generated/app_localizations.dart';

part 'app_l10n_observer.g.dart';

@riverpod
// ignore: deprecated_member_use_from_same_package
AppLocalizations localeObserver(LocaleObserverRef ref) {
  ref.state = lookupAppLocalizations(ui.PlatformDispatcher.instance.locale);
  final observer = LocalObserver((locales) {
    ref.state = lookupAppLocalizations(ui.PlatformDispatcher.instance.locale);
  });

  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);

  ref.onDispose(() {
    binding.removeObserver(observer);
  });

  return ref.state;
}

class LocalObserver extends WidgetsBindingObserver {
  LocalObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
