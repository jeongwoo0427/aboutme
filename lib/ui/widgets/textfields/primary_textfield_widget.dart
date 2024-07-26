import 'package:flutter/material.dart';

class PrimaryTextFieldWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final String? label;
  final String? counterText;
  final String? errorText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? obsecureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? funValidator;
  final ValueChanged<String>? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final EdgeInsets? contentPadding;
  final BoxConstraints? constraints;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool? enabled;
  final bool readOnly;

  const PrimaryTextFieldWidget(
      {this.title = '',
      this.hint = '',
      this.counterText,
      this.errorText,
      this.label,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.obsecureText,
      this.keyboardType,
      this.funValidator,
      this.onChanged,
      this.onSubmitted,
      this.controller,
      this.focusNode,
      this.borderRadius,
      this.borderWidth = 3,
      this.contentPadding =
          const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
      this.constraints,
      this.suffixIcon,
      this.prefixIcon,
      this.enabled,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    BorderRadius _borderRadius = borderRadius ?? BorderRadius.circular(50);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (this.title != '')
          Text(
            this.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
        if (this.title != '')
          SizedBox(
            height: 7,
          ),
        TextFormField(
          focusNode: focusNode,
          maxLength: this.maxLength,
          controller: controller,
          validator: funValidator,
          minLines: minLines,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          obscureText: obsecureText ?? false,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          enabled: enabled,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            counterText: counterText,
            errorText: errorText,
            constraints: constraints,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 25,right: 20),
                child: prefixIcon),
            suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: suffixIcon),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 10, minHeight: 0),
            isDense: true,
            contentPadding: contentPadding,
            enabledBorder: OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(
                    color: themeData.colorScheme.primaryContainer,
                    width: borderWidth)),
            disabledBorder: OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(
                    color: themeData.colorScheme.onBackground.withOpacity(0.6),
                    width: borderWidth)),
            focusedBorder: OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(
                    color: themeData.colorScheme.secondary,
                    width: borderWidth)),
            errorBorder: OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(
                    color: themeData.colorScheme.error, width: borderWidth)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(
                    color: themeData.colorScheme.onBackground,
                    width: borderWidth)),
          ),
        )
      ],
    );
  }
}
