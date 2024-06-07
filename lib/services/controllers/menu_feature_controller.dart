// ignore_for_file: prefer_const_constructors

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
      "🎳 Measure your bowling speed and convert units effortlessly with our user-friendly app! Perfect for bowlers of all levels. 🚀📲";
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
    message = data ?? message;
    Share.share("$message\n App Link: $url");
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
