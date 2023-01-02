import 'package:flutter/material.dart';
import '../color.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 2,
        // shadowColor: FixedColors.purple,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              constraints: BoxConstraints(
                  minHeight: 10,
                  maxWidth: MediaQuery.of(context).size.width * 0.9),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(width: 2, color: FixedColors.purple),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(color: FixedColors.grey)),
              labelStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: FixedColors.purple,
                fontSize: 15,
              ),
              labelText: labelText,
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
