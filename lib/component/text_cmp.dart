import 'package:flutter/material.dart';

Widget text(
    {required String value,
    TextAlign? textAlign,
    int? maxLines,
    double? fontSize,
    TextOverflow? overflow,
    Color? color,
    FontWeight? fontWeight,
    List<Shadow>? shadows}) {
  return Text(
    value,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    style: TextStyle(
      shadows: shadows,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
