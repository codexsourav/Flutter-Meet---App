import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool autofocus;

  const InputBox({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.validator,
    this.icon,
    this.suffixIcon,
    this.hintText,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      validator: validator,
      autofocus: autofocus,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        icon: icon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  static setFocus(context, {focus}) {
    FocusScope.of(context).requestFocus(focus);
  }

  static validateEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
