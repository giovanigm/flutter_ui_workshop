import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_workshop/app/widgets/progress_dialog.dart';

extension ContextX on BuildContext {
  void showSnackBar({
    required Widget content,
    Duration duration = const Duration(seconds: 2),
  }) =>
      WidgetsBinding.instance?.addPostFrameCallback(
          (_) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
                content: content,
                duration: duration,
              )));

  Future<void> showProgressDialog({String? message}) => showDialog(
        context: this,
        barrierDismissible: false,
        builder: (context) => ProgressDialog(message: message),
      );
}
