import 'package:ayurvedic_center/core/constants/app_colors.dart';
import 'package:ayurvedic_center/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.inputFormatters,
    this.keyboardType,
    this.controller,
    this.validator,
  });

  final String label;
  final String hint;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(" $label", style: const TextStyle(fontSize: 16)),
        5.hBox,
        TextFormField(
          controller: controller,
          style: const TextStyle(decorationThickness: 0),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(13),
            enabledBorder: border(),
            focusedBorder: border(),
            filled: true,
            fillColor: AppColors.fieldColor,
            hint: Text(
              hint,
              style: TextStyle(color: Colors.black.withValues(alpha: 0.4)),
            ),
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }

  OutlineInputBorder border() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.53),
    borderSide: BorderSide(
      width: 0.85,
      color: Colors.black.withValues(alpha: 0.1),
    ),
  );
}
