import 'package:flutter/material.dart';

abstract class Utils {

  static String getInfo(BuildContext context) {
    return "HashCode: ${context.hashCode.toString()}\r\t"
        "Type: ${context.widget.runtimeType.toString()}";
  }

  static String getFormattedSize(Size size) {
    return "Size: ${size.width.truncate()}, ${size.height.truncate()}";
  }
}