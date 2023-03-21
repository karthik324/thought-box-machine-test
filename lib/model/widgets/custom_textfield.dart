import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.inputAction,
    required this.keyboardType,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputAction inputAction;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}
