import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final bool optional;
  final void Function(String value) onChanged;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool obscureText;

  const AppTextFormField({
    Key? key,
    required this.label,
    this.initialValue,
    this.optional = false,
    required this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
            labelText: "$label${optional ? " (opcional)" : " *"}"),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        validator: _validateField,
        onChanged: onChanged,
        obscureText: obscureText,
      ),
    );
  }

  String? _validateField(String? value) {
    if (optional) return null;

    if (value != null && value.isEmpty) {
      return "Este campo é necessário";
    }
  }
}
