// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import 'custom_lable_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.title,
    required this.message,
    required this.onTap,
    this.isReverse = false,
  });
  final String title;
  final String message;
  final Function onTap;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    final RxDouble iconPosition = (isReverse ? 0.0 : 0.0).obs;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (isReverse) {
          // Moving from right to left
          if (iconPosition.value - details.delta.dx >= 0) {
            iconPosition.value -= details.delta.dx;
          }
        } else {
          // Moving from left to right
          if (iconPosition.value + details.delta.dx <= Get.width - 44) {
            iconPosition.value += details.delta.dx;
          }
        }
      },
      onHorizontalDragEnd: (details) {
        if (isReverse) {
          iconPosition.value = 0;
        } else {
          iconPosition.value = 0.0;
        }
        onTap();
      },
      child: Stack(
        children: [
          Positioned(
            child: Container(
              margin: EdgeInsets.only(
                  left: isReverse ? 0 : 28.0, right: isReverse ? 28.0 : 0),
              width: Get.width,
              // height: 70,
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4.0)
                      .copyWith(top: 0, bottom: 0),
              decoration: BoxDecoration(
                color: AppColors.yellowColor.withOpacity(0.18),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isReverse ? 18.0 : 38.0),
                  bottomLeft: Radius.circular(isReverse ? 18.0 : 38.0),
                  bottomRight: Radius.circular(isReverse ? 38.0 : 18.0),
                  topRight: Radius.circular(isReverse ? 38.0 : 18.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 6, left: isReverse ? 0 : 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomLabelText(
                        textAlign: TextAlign.start,
                        label: title,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Flexible(
                      child: CustomLabelText(
                        textAlign: TextAlign.start,
                        label: message,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textDarkColor.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    // SizedBox(
                    //   width: 130,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       onTap();
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       foregroundColor: AppColors.textWhiteColor,
                    //       backgroundColor: AppColors.greenColor,
                    //       textStyle: GoogleFonts.rubik(),
                    //     ),
                    //     child: const Text(StringConstants.checkDetails),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: 0,
              bottom: 0,
              left: isReverse ? null : iconPosition.value,
              right: isReverse ? iconPosition.value : null,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textBlueColor.withOpacity(0.9),
                ),
                child: Icon(
                  isReverse ? Iconsax.arrow_left : Iconsax.arrow_right_1,
                  color: AppColors.textWhiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
