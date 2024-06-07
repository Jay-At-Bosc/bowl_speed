// ignore_for_file: unused_import

import 'package:bowl_speed/services/controllers/bowler_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controllers/quick_tap_controller.dart';
import '../../services/routes/app_pages.dart';
import '../../utils/colors.dart';
import '../../utils/labels.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_lable_text.dart';
import '../bowler/bowler_detail.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.47,
      decoration: const BoxDecoration(color: AppColors.textBlueColor),
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.46,
            decoration: BoxDecoration(
              color: AppColors.yellowColor.withOpacity(1),
            ),
            child: Stack(
              children: [
                CustomAppBar(
                  title: "",
                  isHome: true,
                  isBack: false,
                  isHistoryBtnVisible: true,
                  onHistory: QuickTapController.instance.getHistory,
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: SizedBox(
                    width: Get.width / 2,
                    child: CustomLabelText(
                      label: Labels.bannerTitle,
                      style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlueColor.withOpacity(0.9)),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 20,
                  child: SizedBox(
                    width: Get.width,
                    child: CustomLabelText(
                      label: Labels.bannerSubTitle,
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlueColor.withOpacity(0.6)),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.bowlerDetails),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textBlueColor.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                    ),
                    child: Text(
                      Labels.bowlerDetails,
                      style: const TextStyle(color: AppColors.textWhiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 0,
            child: Image.asset(
              Images.bannerImage,
              fit: BoxFit.cover,
              height: Get.height * 0.34,
            ),
          ),
        ],
      ),
    );
  }
}
