import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String? message;

  const ProgressDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(width: 8.0),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                        child: Text(
                      message ?? "Carregando...",
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 18),
                    )),
                    const SizedBox(width: 8.0)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
