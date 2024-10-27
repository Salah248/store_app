import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFeild extends StatelessWidget {
  TextFeild(
      {super.key,
      this.inpuType,
      this.hintText,
      this.onChanged,
      this.obscureText = false});
  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  TextInputType? inpuType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      obscureText: obscureText!,
      keyboardType: inpuType,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: '$hintText',
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
