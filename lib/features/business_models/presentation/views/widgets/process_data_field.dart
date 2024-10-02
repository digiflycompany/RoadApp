import 'package:flutter/material.dart';
import 'package:roadapp/core/Theming/styles.dart';

class ProcessDataField extends StatelessWidget {
  const ProcessDataField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.text,
        style: Styles.textStyle12.copyWith(fontSize: 8, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(3)),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 10)));
  }
}