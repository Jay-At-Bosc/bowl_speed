// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/controllers/unit_conversion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/enums.dart';

class CustomInputDropdown<T extends Unit>
    extends GetView<UnitConversionController> {
  const CustomInputDropdown(
      {super.key,
      required this.formKey,
      required this.formController,
      required this.formOnChanged,
      required this.dropdownValue,
      required this.dropdownItems,
      required this.dropdownonChanged,
      required this.validator,
      required this.focusNode});

  final T dropdownValue;
  final List<T> dropdownItems;
  final GlobalKey<FormState> formKey;
  final TextEditingController formController;
  final void Function(String)? formOnChanged;
  final void Function(T?)? dropdownonChanged;
  final String? Function(String?)? validator;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                // color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.blueColor, width: 1),
              ),
              child: DropdownButton<T>(
                style: GoogleFonts.rubik(
                  color: AppColors.textDarkColor,
                  fontWeight: FontWeight.w400,
                ),
                underline: SizedBox(),
                borderRadius: BorderRadius.circular(10),
                value: dropdownValue,
                items: dropdownItems.map((T unit) {
                  return DropdownMenuItem<T>(
                    value: unit,
                    child: Text(unit.getLabel),
                  );
                }).toList(),
                onChanged: dropdownonChanged,
              ),
            ),
          ),
          SizedBox(width: 6),
          Flexible(
              flex: 4,
              child: Form(
                key: formKey,
                child: TextFormField(
                  focusNode: focusNode,
                  style: GoogleFonts.rubik(
                    color: AppColors.textDarkColor.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    errorMaxLines: 2,
                    errorStyle: GoogleFonts.rubik(
                      fontSize: 0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.blueColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.blueColor),
                    ),
                  ),
                  controller: formController,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: formOnChanged,
                  validator: validator,
                ),
              )),
        ],
      ),
    );
  }
}
