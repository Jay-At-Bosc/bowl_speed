// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:bowl_speed/services/controllers/menu_feature_controller.dart';

import 'package:bowl_speed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/labels.dart';

void customResultDialogue(
  String title,
  String message,
  Function() onPressed,
) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      title: AppBar(
        title: Text(Labels.result),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            alignment: Alignment.topCenter,
            icon: Icon(
              Icons.cancel_outlined,
              color: AppColors.orangeColor,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      content: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: GoogleFonts.rubik(
              fontSize: 18,
            ),
            textScaler: TextScaler.noScaling,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () => MenuFeatureController.instance.shareApp(""),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.orangeColor,
                iconColor: AppColors.orangeColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 4),
                  Text(
                    Labels.save,
                    style: GoogleFonts.rubik(fontSize: 16),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangeColor,
                foregroundColor: Colors.white,
                iconColor: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outlined),
                  SizedBox(width: 4),
                  Text(
                    Labels.save,
                    style: GoogleFonts.rubik(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
