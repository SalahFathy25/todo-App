import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final double cursorHeight;
  final Widget? prefixIcon;
  final TextStyle? style;
  final InputDecoration? decoration;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.cursorHeight = 15,
    this.prefixIcon,
    this.style,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      cursorHeight: cursorHeight,
      style: style ?? const TextStyle(color: Colors.black),
      decoration: decoration ??
          InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
      onFieldSubmitted: (value) {
        controller.text = value;
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        controller.text = value;
      },
    );
  }
}
