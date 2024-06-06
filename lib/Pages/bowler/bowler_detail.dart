import 'package:bowl_speed/services/controllers/bowler_controller.dart';
import 'package:bowl_speed/utils/constants.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:bowl_speed/widgets/custom_card_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_lable_text.dart';
import 'add_bowler_details.dart';

class BowlerDetailScreen extends StatelessWidget {
  const BowlerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.bowlerDetails,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: GetBuilder<BowlerController>(
              init: BowlerController(),
              id: "bowler",
              builder: (ct) {
                return Column(
                  children: [
                    ct.bowlerList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ct.bowlerList.length,
                            itemBuilder: (context, index) {
                              // final history = 0;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: GestureDetector(
                                  onLongPress: () {
                                    ct.toggleDeleteIcon(index);
                                  },
                                  onTap: () {
                                    ct.hideDeleteIcon();
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.containerColor,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildHeader(
                                                  "Bowler ${index + 1}"),
                                              const SizedBox(height: 16.0),
                                              _buildCustomCardRow(
                                                  StringConstants.name,
                                                  ct.bowlerList[index].name
                                                      .capitalize!),
                                              _buildDivider(),
                                              _buildCustomCardRow(
                                                  StringConstants.age,
                                                  ct.bowlerList[index].age
                                                      .toString()),
                                              _buildDivider(),
                                              _buildCustomCardRow(
                                                  StringConstants.bowlerType,
                                                  ct.bowlerList[index].type),
                                              _buildDivider(),
                                              _buildCustomCardRow(
                                                  StringConstants.bowlerStyle,
                                                  ct.bowlerList[index].style),
                                            ],
                                          ),
                                        ),
                                        if (ct.deleteIconIndex == index)
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: AnimatedBuilder(
                                                animation:
                                                    ct.animationController,
                                                builder: (context, child) {
                                                  return Transform.scale(
                                                    scale: ct
                                                        .animationController
                                                        .value,
                                                    child: Transform.rotate(
                                                      angle:
                                                          ct.animationController
                                                                  .value *
                                                              2.0 *
                                                              3.1415926535897932,
                                                      child: InkWell(
                                                        onTap: () {
                                                          ct.deteletBowler(ct
                                                              .bowlerList[index]
                                                              .id!, ct
                                                              .bowlerList[index]
                                                              .name);
                                                        },
                                                        child: const Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : const Text("Not Found"),
                  ],
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddBowlerDetails());
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor1.withOpacity(0.8),
        child: const Icon(
          Iconsax.add,
          size: 34,
          color: AppColors.textWhiteColor,
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
          label: "",
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
