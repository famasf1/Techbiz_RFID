import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/widgets/general_popup_error.dart';

///Common Widget สำหรับแสดงผลข้อมูลจาก [AsyncValue]
class AsyncValueWidget<T> extends ConsumerWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data, this.loading, this.error});
  
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
    // final translation = context.localization;

    return value.when(
      data: data,
      error: error ?? (e, st) {
      //   if (e is ServerException) {
      //     return Center(
      //     child: GeneralPopUpError(
      //   title: translation.errorTxt,
      //   content: kDebugMode ? "Code : ${e.resultCode} \n Error : ${e.developerMessage}" : st.toString(),
      // ));
      //   }
        return Center(
          child: GeneralPopUpError(
        title: "Error",
        content: kDebugMode ? "${e.toString()} \n " : e.toString(),
      ));
      },
      loading: loading ?? () => const Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator.adaptive()),
    );
  }
}