import 'package:flutter/material.dart';

abstract class Device {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double horizontalPadding = 20;
}
