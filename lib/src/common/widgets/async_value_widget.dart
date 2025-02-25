import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/widgets/general_popup_error.dart';

///Common Widget สำหรับแสดงผลข้อมูลจาก [AsyncValue]
class AsyncValueWidget<T> extends ConsumerWidget {
  const AsyncValueWidget(
      {super.key,
      required this.value,
      required this.data,
      this.loading,
      this.error});

  /// ข้อมูลจาก [AsyncValue]
  final AsyncValue<T> value;

  /// เมื่อข้อมูลเป็น [AsyncValue.data] จะทำยังไงกับ Data ที่ได้มา
  final Widget Function(T) data;

  /// - Optional
  ///
  /// แสดง Widget ในระหว่างโหลดข้อมูล
  ///
  /// ถ้าไม่มีจะแสดง [CircularProgressIndicator]
  final Widget Function()? loading;

  /// - Optional
  ///
  /// แสดง Widget กรณีเกิด Error
  ///
  /// ถ้าไม่มีจะแสดง [GeneralPopUpError]
  final Widget Function(Object e, StackTrace st)? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      data: data,
      error: error ??
          (e, st) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await showDialog(
                context: context,
                builder: (context) => GeneralPopUpError(
                  title: context.translation.error,
                  content: kDebugMode ? "${e.toString()} \n " : e.toString(),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(context.translation.okTxt),
                    )
                  ],
                ),
              );
            });

            return SizedBox();
          },
      loading: loading ??
          () => CircularProgressIndicator.adaptive(),
    );
  }
}
