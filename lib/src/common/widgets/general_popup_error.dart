import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Common Widget สำหรับแสดงผลข้อมูลจาก
///
///- [AsyncValue.error]
///- [ServerException]
class GeneralPopUpError extends ConsumerWidget {
  ///ชื่อของ Popup
  final String title;

  ///เนื้อหา Error ของ Popup
  final String content;

  ///ปุ่ม มีไม่มีก็ได้
  final List<Widget>? actions;
  const GeneralPopUpError(
      {super.key, required this.title, required this.content, this.actions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: actions,
    );
  }
}
