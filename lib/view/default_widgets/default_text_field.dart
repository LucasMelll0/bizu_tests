import 'package:flutter/material.dart';

import '../../res/dimens.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      this.label,
      this.prefixIcon,
      this.maxLength,
      this.maxLines,
      this.onChanged,
      this.obscureText = false,
      this.suffixIcon});

  final Widget? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(

      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(default_radius)),
        contentPadding: const EdgeInsets.all(default_padding),
        label: label,
        prefixIcon: prefixIcon,
        prefixIconColor: theme.colorScheme.primary,
        suffixIcon: suffixIcon,
        suffixIconColor: theme.colorScheme.primary
      ),
    );
  }
}
