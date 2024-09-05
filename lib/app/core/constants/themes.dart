

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getCustomTextStyle({double fontSize = 30, FontWeight fontWeight = FontWeight.w400, Color color = Colors.black}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}