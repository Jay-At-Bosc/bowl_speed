// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void customResultDialogue(
  String title,
  String message,
) {
  Get.dialog(
    AlertDialog(
      title: AppBar(
        title: Text('RESULT'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            alignment: Alignment.topCenter,
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.grey,
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
        ElevatedButton(
          onPressed: () => ManualCalculatorController.instance.onSave(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff006769),
              foregroundColor: Colors.white,
              iconColor: Colors.white),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outlined, color: Colors.white),
              SizedBox(width: 4),
              Text(
                "save",
                style: GoogleFonts.rubik(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
