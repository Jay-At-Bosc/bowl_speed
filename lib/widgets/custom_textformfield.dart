// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.filedTitle,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.focusNode, 
    required this.formOnSubmit,
  });

  final String filedTitle;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
   final void Function() formOnSubmit;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(filedTitle),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: controller,
          autofocus: false,
          keyboardType: TextInputType.number,
          cursorColor: AppColors.blueColor,
          cursorErrorColor: Colors.red,
          focusNode: focusNode,
          style: GoogleFonts.rubik(
              fontSize: 14,
              height: 1.3,
              fontWeight: FontWeight.w500,
              color: AppColors.blueColor.withOpacity(0.9)),
          decoration: InputDecoration(
            hintMaxLines: 1,
            errorMaxLines: 2,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14),
                errorStyle: GoogleFonts.rubik(
                  fontSize: 0,
                ),
            hintStyle: GoogleFonts.rubik(
                fontSize: 14,
                height: 1.3,
                fontWeight: FontWeight.w500,
                color: AppColors.blueColor.withOpacity(0.6)),
            filled: true,
            fillColor: AppColors.orangeColor.withOpacity(0.1),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.greenColor, width: 0.5),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor1),
              borderRadius: BorderRadius.circular(14),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          validator: validator,
          onFieldSubmitted: (_){
            formOnSubmit;
          },
        ),
      ],
    );
  }
}
