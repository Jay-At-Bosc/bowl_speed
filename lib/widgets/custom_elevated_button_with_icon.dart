// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customElevatedButtonWithIcon(Function() onTap, String label,
    Color bgColor, Color fgColor, IconData icon) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      // iconColor: fgColor,
      padding: EdgeInsets.symmetric(horizontal: 14.0),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.rubik(fontSize: 16),
        ),
      ],
    ),
  );
}
