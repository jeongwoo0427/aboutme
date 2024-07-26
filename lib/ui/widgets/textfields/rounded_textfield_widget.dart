import 'package:flutter/material.dart';

class RoundedTextFieldWidget extends StatelessWidget {
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
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool? enabled;
  final bool readOnly;

  const RoundedTextFieldWidget(
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
      this.borderWidth = 1,
      this.contentPadding =
          const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      this.constraints,
      this.prefixIcon,
      this.suffixIcon,
      this.enabled,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != '')
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
        if (title != '')
          const SizedBox(
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
            filled: true,
            fillColor: themeData.colorScheme.surface,
            prefixIcon: prefixIcon!=null?Padding(padding: const EdgeInsets.only(left: 10,right: 10),child: prefixIcon,):null,
            suffixIcon: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: suffixIcon),
            suffixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 0),
            isDense: true,
            contentPadding: this.contentPadding,
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: themeData.colorScheme.onBackground.withOpacity(0.3),
                    width: borderWidth)),
            disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: themeData.colorScheme.onBackground.withOpacity(0.3),
                    width: borderWidth)),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: themeData.colorScheme.primary, width: borderWidth)),
            errorBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: themeData.colorScheme.error, width: borderWidth)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: themeData.colorScheme.onBackground,
                    width: borderWidth)),
          ),
        )
      ],
    );
  }
}
