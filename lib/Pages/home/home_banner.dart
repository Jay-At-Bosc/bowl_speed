// ignore_for_file: unused_import

import 'package:bowl_speed/imports_manager.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.47,
      decoration: const BoxDecoration(color: AppColors.orangeColor),
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.46,
            decoration: const BoxDecoration(
              color: AppColors.blueColor,
            ),
            child: Stack(
              children: [
                CustomAppBar(
                    title: "",
                    isHome: true,
                    isBack: false,
                    isHistoryBtnVisible: true,
                    onHistory: () {
                      QuickTapController.instance.updatedHistory();
                      Get.toNamed(Routes.quickTapCalcHistory);
                    }),
                Positioned(
                  top: Get.height * 0.09,
                  left: 20,
                  child: SizedBox(
                    width: Get.width / 2.2,
                    child: CustomLabelText(
                      label: Labels.bannerTitle,
                      style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhiteColor),
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
                          color: AppColors.textWhiteColor.withOpacity(0.9)),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.bowlerDetails),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeColor,
                      elevation: 0,
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
