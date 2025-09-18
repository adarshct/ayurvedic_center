import 'package:flutter/material.dart';

extension NumberExtension on num {
  Widget get hBox => SizedBox(height: toDouble());

  Widget get wBox => SizedBox(width: toDouble());
}

extension StringExtension on String {
  String get upperFirst =>
      length > 1 ? "${this[0].toUpperCase()}${substring(1)}" : toUpperCase();

  String get getFirstLetter =>
      length > 1 ? this[0].toUpperCase() : toUpperCase();
}
