// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/colors.dart';
import 'custom_menu_features.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  final Function()? onHistory;
  final bool isHistoryBtnVisible;
  final bool isHome;
  final String? message;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isBack = true,
    this.onHistory,
    this.isHistoryBtnVisible = false,
    this.isHome = false,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: isHome ? AppColors.blueColor : AppColors.orangeColor,
      foregroundColor: AppColors.textWhiteColor,
      title: Text(
        title,
        style: GoogleFonts.rubik(),
      ),
      automaticallyImplyLeading: false,
      leading: isBack
          ? IconButton(
              onPressed: () => AppPages.back,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textWhiteColor,
              ),
            )
          : null,
      actions: [
        if (isHistoryBtnVisible)
          IconButton(
            onPressed: onHistory,
            icon: Icon(
              Iconsax.timer_start,
              color: isHome ? AppColors.orangeColor : AppColors.textWhiteColor,
            ),
          ),
        CustomMenuFeatures(
          isHome: isHome,
          message: message,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
