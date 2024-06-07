import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:bowl_speed/utils/labels.dart';

import '../../utils/colors.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_card_row.dart';
import '../../widgets/custom_lable_text.dart';
import '../bowler/bowler_report.dart';

class QuickTapHistoryScreen extends GetView<QuickTapController> {
  const QuickTapHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Labels.history,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomFilterDropDown(controller: controller),
              const SizedBox(height: 6.0),
              GetBuilder<QuickTapController>(builder: (context) {
                return controller.filterHistoryList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.filterHistoryList.length,
                        itemBuilder: (context, index) {
                          final history = controller.filterHistoryList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.containerColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildHeader(history.bowler),
                                    const SizedBox(height: 16.0),
                                    _buildCustomCardRow("${Labels.pitchSize} :",
                                        history.distance.toString()),
                                    _buildDivider(),
                                    _buildCustomCardRow(
                                        "${Labels.timeOfTravel} :",
                                        history.time),
                                    _buildDivider(),
                                    _buildCustomCardRow(Labels.speedKmh,
                                        history.kmh.toStringAsFixed(2)),
                                    _buildDivider(),
                                    _buildCustomCardRow(Labels.speedMhp,
                                        history.mps.toStringAsFixed(2)),
                                    _buildDivider(),
                                    _buildCustomCardRow(
                                        "${Labels.measurementType} :",
                                        history.measurementType),
                                    _buildDivider(),
                                    _buildCustomCardRow(
                                        "${Labels.date} :", history.date),
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
          label: bowler,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        CustomLabelText(
          label: Labels.cricket,
          style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
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
