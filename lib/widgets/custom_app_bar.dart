import 'package:bowl_speed/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../pages/demo.dart';
import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;
  final Function onHistory;
  final Color color;
  final bool? isHistoryBtnVisible;
  final bool isHome;
  // final List<PopupMenuEntry> popupMenuItems;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBack,
    required this.onHistory,
    this.color = AppColors.orangeColor,
    this.isHistoryBtnVisible = true,
    this.isHome = false,
    // required this.popupMenuItems,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: color,
      foregroundColor: AppColors.textWhiteColor,
      title: Text(
        title,
        style: GoogleFonts.rubik(),
      ),
      actions: [
        if (isHistoryBtnVisible == true)
          IconButton(
            onPressed: () {
              onHistory();
            },
            icon: Icon(
              Iconsax.timer_start,
              color:
                  isHome ? AppColors.textWhiteColor : AppColors.textWhiteColor,
            ),
          ),
        PopupMenuButton(
          iconColor:
              isHome ? AppColors.textWhiteColor : AppColors.textWhiteColor,
          itemBuilder: (context) => [
            buildMenuItem('Rate us', () {}),
            buildMenuItem('Share app', () {}),
            buildMenuItem('Contact us', () {}),
            buildMenuItem('Privacy Policy', () {
              Get.to(() => const Demo());
            }),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
