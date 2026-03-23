import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:flutter/services.dart';

Future<void> copyThisToClipBoard(String trim) async {
  await Clipboard.setData(ClipboardData(text: trim));
  GlobalSnackBar.showSuccess('Copied to Clipboard');
}
