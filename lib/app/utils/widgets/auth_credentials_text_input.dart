import 'package:flutter/material.dart';
import 'package:meta_track/app/utils/widgets/models/text_input_type_enum.dart';

class AuthCredentialsTextInput extends StatelessWidget {
  final TextInputTypeEnum textInputType;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscureText;

  const AuthCredentialsTextInput({
    super.key,
    required this.textInputType,
    required this.currentFocus,
    this.nextFocus,
    required this.controller,
    this.suffixIcon,
    this.obscureText,
  });

  String? emailValidator(String? value) {
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value ?? '')) {
      return 'Enter with a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter with a valid password';
    }
    return null;
  }

  void onEditingComplete() {
    currentFocus.unfocus();
    if (textInputType == TextInputTypeEnum.email && nextFocus != null) {
      nextFocus?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: currentFocus,
      onTapOutside: (event) => currentFocus.unfocus(),
      onEditingComplete: () => onEditingComplete(),
      validator: textInputType == TextInputTypeEnum.email
          ? (value) => emailValidator(value)
          : (value) => passwordValidator(value),
      keyboardType: textInputType == TextInputTypeEnum.email
          ? TextInputType.emailAddress
          : TextInputType.visiblePassword,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: textInputType == TextInputTypeEnum.email
            ? Text('Email')
            : Text('Password'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
