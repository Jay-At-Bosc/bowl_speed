// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/controllers/unit_conversion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';

class CustomInputDropdown<T extends Unit> extends GetView<UnitConversionController> {
  const CustomInputDropdown( 
      {
      super.key,
      required this.formKey,
      required this.formController,
      required this.formOnChanged,
      required this.dropdownValue,
      required this.dropdownItems,
      required this.dropdownonChanged,
      required this.validator,
      });

  final T dropdownValue;
  final List<T> dropdownItems;
  final GlobalKey<FormState> formKey;
  final TextEditingController formController;
  final void Function(String)? formOnChanged;
  final void Function(T?)? dropdownonChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 5,
          child: DropdownButton<T>(
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
        SizedBox(width: 6),
        Flexible(
            flex: 4,
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: formController,
                keyboardType: TextInputType.number,
                onChanged: formOnChanged,
                validator: validator,
              ),
            )),
      ],
    );
  }
}
