import 'package:afectod/app/common/widgets/textfield/afectod_textfield.dart';
import 'package:flutter/material.dart';

class AuthPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscureText;
  final VoidCallback onToggleVisibility;
  final String? Function(String?)? validator;

  const AuthPasswordField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.obscureText,
    required this.onToggleVisibility,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return AfectodTextField(
      controller: controller,
      label: label,
      hintText: hint,
      prefixIcon: Icons.lock_outline,
      obscureText: obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        ),
        onPressed: onToggleVisibility,
      ),
      validator: validator,
    );
  }
}

