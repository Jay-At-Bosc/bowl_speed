// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';

import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/labels.dart';
import '../../widgets/custom_card_row.dart';

class ManualCalcHistory extends GetView<ManualCalculatorController> {
  const ManualCalcHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.history,
      ),
      body: controller.historyList.isEmpty
          ? Center(child: Text(Labels.historyNotFound))
          : ListView.builder(
              itemCount: controller.historyList.length,
              itemBuilder: (context, index) {
                var obj = controller.historyList[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0, left: 20, right: 20, top: 20),
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
                          _buildCustomCardRow(
                              "${Labels.pitchSize} :", obj.distance.toString()),
                          _buildDivider(),
                          _buildCustomCardRow(
                              "${Labels.timeOfTravel} :", obj.time.toString()),
                          _buildDivider(),
                          _buildCustomCardRow(
                              Labels.speedKmh, obj.kmh.toStringAsFixed(2)),
                          _buildDivider(),
                          _buildCustomCardRow(
                              Labels.speedMhp, obj.mph.toStringAsFixed(2)),
                          _buildDivider(),
                          _buildCustomCardRow("${Labels.measurementType} :",
                              obj.measurementType),
                          _buildDivider(),
                          _buildCustomCardRow("${Labels.date} :", obj.date),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
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

// class CustomRowForHistoryCard extends StatelessWidget {
//   const CustomRowForHistoryCard(
//       {super.key, required this.property, required this.value});

//   final String property;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Text(
//               property.toUpperCase(),
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(value),
//           ),
//         ],
//       ),
//     );
//   }
// }