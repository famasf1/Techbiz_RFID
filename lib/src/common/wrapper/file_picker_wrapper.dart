import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_picker_wrapper.g.dart';

@riverpod
FilePickerWrapper filePickerWrapper(Ref ref) => FilePickerWrapper();

class FilePickerWrapper {
  Future<File?> pickFile() async {
    var file = await FilePicker.platform.pickFiles();
    if (file != null) {
      return File(file.files.first.path!);
    } else {
      return null;
    }
  }
}
