// ignore_for_file: unused_import

import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:bowl_speed/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bowl_speed/utils/labels.dart';

import '../../services/controllers/bowler_controller.dart';
import '../../services/models/bowler_model.dart';
import '../../utils/colors.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_card_row.dart';
import '../../widgets/custom_lable_text.dart';

class BowlerReportScreen extends GetView<QuickTapController> {
  const BowlerReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Labels.bowlerReport,
      ),
      body: controller.filterList.isEmpty
          ? Center(child: Text(Labels.historyNotFound))
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomFilterDropDown(
                      controller: controller,
                      isHistory: false,
                    ),
                    const SizedBox(height: 6.0),
                    GetBuilder<QuickTapController>(builder: (context) {
                      return controller.filterList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.filterList.length,
                              itemBuilder: (context, index) {
                                final report = controller.filterList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.blueColor.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildHeader(report.name),
                                          const SizedBox(height: 16.0),
                                          _buildCustomCardRow(
                                              "${Labels.minSpeed} :",
                                              "${report.minSpeed.toStringAsFixed(1)} Km/h"),
                                          _buildDivider(),
                                          _buildCustomCardRow(
                                              "${Labels.avgSpeed} :",
                                              "${report.avgSpeed.toStringAsFixed(1)} Km/h"),
                                          _buildDivider(),
                                          _buildCustomCardRow(Labels.maxSpeed,
                                              "${report.maxSpeed.toStringAsFixed(1)} Km/h"),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Text("Not Found");
                    }),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildHeader(String bowler) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomLabelText(
          label: bowler.capitalize!,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildCustomCardRow(String label, String value) {
    return CustomCardRow(
      label: label,
      value: value,
    );
  }

  Widget _buildDivider() {
    return const Divider();
  }
}

class CustomFilterDropDown extends StatelessWidget {
  const CustomFilterDropDown({
    super.key,
    required this.controller,
    this.isHistory = true,
  });
  final bool isHistory;

  final QuickTapController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomLabelText(
            label: "${Labels.chooseBowler} :",
            style: GoogleFonts.rubik(
                fontSize: 12,
                color: AppColors.textDarkColor.withOpacity(0.7),
                fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: GetBuilder<BowlerController>(
            id: 'bowler',
            builder: (ct) {
              return DropdownButtonFormField<String>(
                hint: const Text('Select Bowler'),
                style: GoogleFonts.rubik(
                    color: AppColors.textDarkColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
                decoration: const InputDecoration(
                  // isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 10.0,
                  ),
                  border: InputBorder.none,
                ),
                value: ct.bowlerList.isNotEmpty ? ct.bowlerList[0].name : null,
                onChanged: (String? newValue) {
                  controller.selectBowler(newValue!);
                  if (isHistory) {
                    controller.filterHistory(newValue);
                  } else {
                    controller.filterReports(newValue);
                  }
                },
                items: <DropdownMenuItem<String>>[
                  const DropdownMenuItem<String>(
                    value: "", // Use null for the default option
                    child: Text('Select Bowler'),
                  ),
                  ...ct.bowlerList
                      .map<DropdownMenuItem<String>>((BowlerDetails value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(
                        value.name.capitalizeFirst ?? "",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                      ),
                    );
                  }),
                ],
                validator: (value) =>
                    value == null ? 'Please select an option' : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
