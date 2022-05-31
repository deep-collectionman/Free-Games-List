import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle defaultTextStyle({
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
  double? fontSize,
  double? letterSpacing,
}) => GoogleFonts.bebasNeue().copyWith(
  color: color,
  fontWeight: fontWeight,
  fontSize: fontSize,
  letterSpacing: letterSpacing,
);