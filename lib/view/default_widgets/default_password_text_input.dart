import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_tests/view/default_widgets/default_text_field.dart';

class DefaultPasswordTextField extends StatefulWidget {
  DefaultPasswordTextField({super.key, this.onChanged});

  final Function (String)? onChanged;

  @override
  State<DefaultPasswordTextField> createState() =>
      _DefaultPasswordTextFieldField();
}

class _DefaultPasswordTextFieldField extends State<DefaultPasswordTextField> {
  bool hidePassword = true;


  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      onChanged: widget.onChanged,
      label: Text('Insira sua Senha'),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        icon: Icon(hidePassword
            ? CupertinoIcons.eye_fill
            : CupertinoIcons.eye_slash_fill),
      ),
      obscureText: hidePassword,
      maxLines: 1,
    );
  }
}
