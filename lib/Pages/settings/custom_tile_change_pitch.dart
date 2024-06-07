// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.label, this.onTap});

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.rubik(),
      ),
      tileColor: AppColors.blueColor.withOpacity(0.15),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onTap: onTap,
    );
  }
}
