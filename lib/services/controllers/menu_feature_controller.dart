// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'dart:developer';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class MenuFeatureController extends GetxController {
  static MenuFeatureController instance = Get.find<MenuFeatureController>();
  String playStore =
      "https://play.google.com/store/apps/details?id=your_app_id";
  String appStore = "your_app_id";
  String message =
      "Hey! Just wanted to share a cool cricket-related calculation with you. I've been using this awesome app to calculate bowling speed using video footage. It's super handy! If you're into cricket and want to analyze bowling speed, check it out:";
  String url = "";

  void rateUs() async {
    log("rate us");
    url = onAndroid();
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      Get.snackbar("Error", "Network Error");
    }
  }

  void shareApp(String? data) {
    log("share app");
    url = onAndroid();
    
    Share.share("$message ${url}. Enjoy!");
  }

  void openPrivacyPolicy() {
    Get.toNamed(Routes.privacyPolicy);
  }

  String onAndroid() {
    if (Platform.isAndroid) {
      return playStore;
    } else {
      return appStore;
    }
  }
}
