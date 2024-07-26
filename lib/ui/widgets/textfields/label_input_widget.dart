import 'package:flutter/material.dart';
import '../layouts/label_layout.dart';
import 'rounded_textfield_widget.dart';

class LabelInputField extends StatelessWidget {
  final String label;
  final String buttonText;
  final TextEditingController? controller;
  final String? Function(String?)? funValidator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onPressedButton;
  final bool? obsecureText;
  final String? hint;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final bool readOnly;

  const LabelInputField({
    Key? key,
    required this.label,
    this.buttonText = '',
    this.controller,
    this.funValidator,
    this.onChanged,
    this.onPressedButton,
    this.obsecureText,
    this.hint,
    this.enabled = true,
    this.maxLength,
    this.maxLines,
    this.readOnly = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabelLayout(
        label: label,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: RoundedTextFieldWidget(
                  maxLength: maxLength,
                  maxLines: maxLines,
                  onChanged: onChanged,
                  obsecureText: obsecureText,
                  funValidator: funValidator,
                  controller: controller,
                  hint: hint,
                  enabled: enabled,
                  readOnly: readOnly,
                )),
          ],
        ));
  }
}
