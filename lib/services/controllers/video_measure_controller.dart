import 'dart:developer';
import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:bowl_speed/services/controllers/bowler_controller.dart';
import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/labels.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../pages/video_measure/player.dart';
import '../../utils/db_helper.dart';
import '../../utils/formate_functions.dart';
import '../models/quick_tap_model.dart';

class VideoMeasureController extends GetxController {
  static VideoMeasureController get instance => Get.find();
  static String get screenId => "screenId";

  String videoUri = "";
  bool isLoading = true;
  bool isLandscape = false;
  int point1 = 0;
  int point2 = 0;
  double speed = 0;
  String formattedTime = '00:00:00';
  double speedInMph = 0.0;

  late CustomVideoPlayerController customVideoPlayerController;
  late CachedVideoPlayerController cachedVideoPlayerController;

  @override
  void onInit() {
    super.onInit();
    //initializeVideoPlayer();
  }

  Future<void> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      isLandscape = true;

      videoUri = file.path;
      Get.to(() => const Player());
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]); // Reset to portrait
      update();
      initializeVideoPlayer();
      // cachedVideoPlayerController.play();
    }
  }

  @override
  void onClose() {
    super.onClose();
    isLandscape = false;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    update();
  }

  void showAlert() async {
    speed = calculateSpeedInKmPerHour(20, point2 - point1);
    showDialog();
  }

  Future<dynamic> showDialog() {
    return Get.defaultDialog(
      title: "Bowl Speed",
      middleText: "${speed.toStringAsFixed(1)} km/h",
      textConfirm: Labels.save,
      textCancel: Labels.cancel,
      onConfirm: () async {
        QuickTapModel model = QuickTapModel(
            bowler: BowlerController.instance.bowlerList.first.name,
            distance: 20,
            time: formattedTime,
            kmh: speed,
            mps: speedInMph,
            measurementType: Labels.videoTap,
            date: formatDateTime(DateTime.now()));
        await DatabaseHelper.instance.insertQuickTapCalculator(model);
        Get.back();
        Get.snackbar("Saved", "Recored Saved...");
      },
      confirmTextColor: AppColors.textWhiteColor,
      cancelTextColor: AppColors.textDarkColor,
      buttonColor: AppColors.primaryColor,
      barrierDismissible: false,
      radius: 1.0,
      middleTextStyle: GoogleFonts.rubik(),
      titleStyle: GoogleFonts.rubik(),
    );
  }

  double calculateSpeedInKmPerHour(
      double distanceInMeters, int timeInMilliseconds) {
    double distanceInKilometers = distanceInMeters / 1000.0;

    double timeInHours = timeInMilliseconds / (1000.0 * 60 * 60);
    formattedTime = QuickTapController.instance.formatTime(timeInMilliseconds);

    if (timeInHours == 0) {
      throw ArgumentError("Time cannot be zero");
    }
    speedInMph = (distanceInKilometers / timeInHours) * 0.621371;

    return distanceInKilometers / timeInHours;
  }

  void initializeVideoPlayer() {
    isLoading = true;
    update();

    cachedVideoPlayerController = CachedVideoPlayerController.network(videoUri)
      ..initialize().then((value) {
        isLoading = false;
        update();
      });

    customVideoPlayerController = CustomVideoPlayerController(
      context: Get.context!,
      videoPlayerController: cachedVideoPlayerController,
      customVideoPlayerSettings: CustomVideoPlayerSettings(
        autoFadeOutControls: true,
        showDurationPlayed: true,
        allowVolumeOnSlide: false,
        enterFullscreenOnStart: true,
        exitFullscreenOnEnd: false,
        // exitFullscreenButton: const SizedBox(),
        showMuteButton: false,
        showDurationRemaining: false,
        alwaysShowThumbnailOnVideoPaused: false,
        pauseButton: Row(
          children: [
            IconButton(
              onPressed: () {
                final Duration currentPosition =
                    cachedVideoPlayerController.value.position;
                final Duration frameDuration =
                    Duration(milliseconds: (1000 / 60).round());
                final Duration newPosition = currentPosition - frameDuration;
                cachedVideoPlayerController.seekTo(newPosition);
                log(newPosition.toString());
              },
              icon: const ControllIcons(icon: Icons.skip_previous_outlined),
            ),
            IconButton(
                onPressed: () {
                  final Duration currentPosition =
                      cachedVideoPlayerController.value.position;
                  final Duration frameDuration =
                      Duration(milliseconds: (4000 / 60).round());
                  final Duration newPosition = currentPosition - frameDuration;
                  cachedVideoPlayerController.seekTo(newPosition);
                  log(newPosition.toString());
                },
                icon: const ControllIcons(icon: Icons.skip_previous)),
            IconButton(
                onPressed: () {
                  cachedVideoPlayerController.pause();
                },
                icon: const ControllIcons(icon: Icons.pause_outlined)),
            IconButton(
                onPressed: () {
                  final Duration currentPosition =
                      cachedVideoPlayerController.value.position;
                  final Duration frameDuration =
                      Duration(milliseconds: (4000 / 60).round());
                  final Duration newPosition = currentPosition + frameDuration;
                  cachedVideoPlayerController.seekTo(newPosition);
                  log(newPosition.toString());
                },
                icon: const ControllIcons(icon: Icons.skip_next)),
            IconButton(
              onPressed: () {
                final Duration currentPosition =
                    cachedVideoPlayerController.value.position;
                final Duration frameDuration =
                    Duration(milliseconds: (1000 / 60).round());
                final Duration newPosition = currentPosition + frameDuration;
                cachedVideoPlayerController.seekTo(newPosition);
                log(newPosition.toString());
              },
              icon: const ControllIcons(
                icon: Icons.skip_next_outlined,
              ),
            ),
          ],
        ),
        systemUIModeInsideFullscreen: SystemUiMode.leanBack,
        settingsButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "",
                  "",
                  snackPosition: SnackPosition.TOP,
                  duration: const Duration(seconds: 1),
                  messageText: Text(
                    "Release Point Noted",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(color: AppColors.textWhiteColor),
                  ),
                  barBlur: 0,
                  backgroundColor: Colors.transparent,
                );
                customVideoPlayerController.videoPlayerController.pause();
                point1 = customVideoPlayerController
                    .videoPlayerController.value.position.inMilliseconds;
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.textDarkColor.withOpacity(0.6),
                backgroundColor: AppColors.yellowColor.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                Labels.release,
                style: TextStyle(fontSize: 12),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                customVideoPlayerController.videoPlayerController.pause();

                point2 = customVideoPlayerController
                    .videoPlayerController.value.position.inMilliseconds;
                log("Reached At: $point2");
                showAlert();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.textDarkColor.withOpacity(0.6),
                backgroundColor: AppColors.yellowColor.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                Labels.reach,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        playButton: Row(
          children: [
            IconButton(
                onPressed: () {
                  final Duration currentPosition =
                      cachedVideoPlayerController.value.position;
                  final Duration frameDuration =
                      Duration(milliseconds: (1000 / 60).round());
                  final Duration newPosition = currentPosition - frameDuration;
                  cachedVideoPlayerController.seekTo(newPosition);
                  log(newPosition.toString());
                },
                icon: const ControllIcons(icon: Icons.skip_previous_outlined)),
            IconButton(
                onPressed: () {
                  final Duration currentPosition =
                      cachedVideoPlayerController.value.position;
                  final Duration frameDuration =
                      Duration(milliseconds: (4000 / 60).round());
                  final Duration newPosition = currentPosition - frameDuration;
                  cachedVideoPlayerController.seekTo(newPosition);
                  log(newPosition.toString());
                },
                icon: const ControllIcons(icon: Icons.skip_previous)),
            IconButton(
                onPressed: () {
                  cachedVideoPlayerController.play();
                },
                icon: const ControllIcons(icon: Icons.play_arrow)),
            IconButton(
                onPressed: () {
                  final Duration currentPosition =
                      cachedVideoPlayerController.value.position;
                  final Duration frameDuration =
                      Duration(milliseconds: (4000 / 60).round());
                  final Duration newPosition = currentPosition + frameDuration;
                  cachedVideoPlayerController.seekTo(newPosition);
                  log(newPosition.toString());
                },
                icon: const ControllIcons(icon: Icons.skip_next)),
            IconButton(
                onPressed: () {
                  final Duration currentPosition =
                      cachedVideoPlayerController.value.position;
                  final Duration frameDuration =
                      Duration(milliseconds: (1000 / 60).round());
                  final Duration newPosition = currentPosition + frameDuration;
                  cachedVideoPlayerController.seekTo(newPosition);
                  log(newPosition.toString());
                },
                icon: const ControllIcons(icon: Icons.skip_next_outlined)),
          ],
        ),
      ),
    );
    // cachedVideoPlayerController.play();
  }
}

class ControllIcons extends StatelessWidget {
  const ControllIcons({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.yellowColor,
      ),
      child: Center(
        child: Icon(
          icon,
          color: AppColors.textDarkColor.withOpacity(0.6),
          size: 24,
        ),
      ),
    );
  }
}
