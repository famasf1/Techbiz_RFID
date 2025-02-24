import 'package:flutter/material.dart';

class SettingItem {
  SettingItem({
    required this.header,
    required this.title,
    required this.content,
  });

  final String header;
  final String title;
  final Widget content;
}