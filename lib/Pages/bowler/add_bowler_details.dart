import 'package:bowl_speed/services/controllers/bowler_controller.dart';
import 'package:bowl_speed/services/models/bowler_model.dart';
import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/db_helper.dart';
import '../../utils/formate_functions.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_form_fields.dart';

class AddBowlerDetails extends GetView<BowlerController> {
  const AddBowlerDetails({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Labels.addBowler,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomFormField(
                label: Labels.bowlerName,
                controller: controller.nameController,
              ),
              CustomFormField(
                label: Labels.bowlerAge,
                keyboardType: TextInputType.number,
                controller: controller.ageController,
              ),
              CustomFormField(
                label: Labels.bowlerType,
                isDropDown: true,
                controller: TextEditingController(),
                list: controller.bowlersType,
              ),
              CustomFormField(
                label: Labels.bowlerStyle,
                isDropDown: true,
                controller: TextEditingController(),
                list: controller.bowlersStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    BowlerDetails bowler = BowlerDetails(
                        name: controller.nameController.text,
                        age: int.parse(controller.ageController.text),
                        type: controller.selectedBowlerType,
                        style: controller.selectedBowlerStyle,
                        date: formatDateTime(DateTime.now()));
                    await DatabaseHelper.instance.insertBowlerDetails(bowler);
                    controller.getAllBowlers();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all details')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor1.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 14.0,
                  ),
                ),
                child: Text(
                  Labels.bowlerDetails,
                  style: const TextStyle(color: AppColors.textWhiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
