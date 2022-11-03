import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    this.hintText,
    this.hintColor,
    this.fillColor,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);
  final TextEditingController controller;
  final String? hintText;
  final Color? hintColor;
  final Color? fillColor;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(color: fillColor ?? Colors.white)),
          filled: true,
          fillColor: fillColor ?? Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor ?? Colors.grey,fontWeight: FontWeight.w300, fontSize: 16),
        ),
      ),
    );
  }
}