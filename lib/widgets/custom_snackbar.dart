
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void customSnackbar(String message) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            message,
            maxLines: 3,
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
        ),
      );
}