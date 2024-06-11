import 'dart:developer';
import 'dart:io';

import 'package:bowl_speed/imports_manager.dart';


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
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      update();
      initializeVideoPlayer();
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

  void showDialog() {
    customAnimatedDialogue(
      Get.context!,
      Labels.result,
      "${speed.toStringAsFixed(1)} km/h",
      () async {
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
      })
      ..play();

    customVideoPlayerController = CustomVideoPlayerController(
      context: Get.context!,
      videoPlayerController: cachedVideoPlayerController,
      customVideoPlayerSettings: CustomVideoPlayerSettings(
        autoFadeOutControls: true,
        showDurationPlayed: true,
        showDurationRemaining: true,
        allowVolumeOnSlide: false,
        enterFullscreenOnStart: true,
        exitFullscreenOnEnd: false,
        showMuteButton: false,
        customAspectRatio: 1.7666666666666666,
        showPlayButton: true,
        showSeekButtons: false,
        settingsButtonAvailable: false,
        customVideoPlayerProgressBarSettings:
            const CustomVideoPlayerProgressBarSettings(),
        exitFullscreenButton: Row(
          children: [
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
                    Duration(milliseconds: (2000 / 60).round());
                final Duration newPosition = currentPosition + frameDuration;
                cachedVideoPlayerController.seekTo(newPosition);
                log(newPosition.toString());
              },
              icon: const ControllIcons(
                icon: Icons.skip_next_outlined,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                customVideoPlayerController.videoPlayerController.pause();

                if (point1 <= 0) {
                  ScaffoldMessenger.of(Get.context!).showSnackBar(
                    snackBarAnimationStyle: AnimationStyle(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceIn),
                    const SnackBar(
                      content: Text("Error...! Set Release Point First"),
                    ),
                  );

                  return;
                }
                point2 = customVideoPlayerController
                    .videoPlayerController.value.position.inMilliseconds;
                log("Reached At: $point2");
                showAlert();
                point1 = 0;
                point2 = 0;
                update();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.textWhiteColor.withOpacity(0.8),
                backgroundColor: AppColors.orangeColor.withOpacity(1),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                Labels.reach,
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
        pauseButton: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // update();
                ScaffoldMessenger.of(Get.context!).showSnackBar(
                  snackBarAnimationStyle: AnimationStyle(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceIn),
                  const SnackBar(
                    content: Text("Release Point Noted... 🏏"),
                  ),
                );

                customVideoPlayerController.videoPlayerController.pause();
                point1 = customVideoPlayerController
                    .videoPlayerController.value.position.inMilliseconds;
                // initializeVideoPlayer();
                update();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.textWhiteColor.withOpacity(0.8),
                backgroundColor: AppColors.orangeColor.withOpacity(1),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                Labels.release,
                style: TextStyle(fontSize: 13),
              ),
            ),
            IconButton(
              onPressed: () {
                final Duration currentPosition =
                    cachedVideoPlayerController.value.position;
                final Duration frameDuration =
                    Duration(milliseconds: (2000 / 60).round());
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
          ],
        ),
        systemUIModeInsideFullscreen: SystemUiMode.leanBack,
        playButton: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                update();
                ScaffoldMessenger.of(Get.context!).showSnackBar(
                  snackBarAnimationStyle: AnimationStyle(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceIn),
                  const SnackBar(
                    content: Text("Release Point Noted... 🏏"),
                  ),
                );

                customVideoPlayerController.videoPlayerController.pause();
                point1 = customVideoPlayerController
                    .videoPlayerController.value.position.inMilliseconds;
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.textWhiteColor.withOpacity(0.8),
                backgroundColor: AppColors.orangeColor.withOpacity(1),
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
            IconButton(
                onPressed: () {
                  final Duration currentPosition =
                      cachedVideoPlayerController.value.position;
                  final Duration frameDuration =
                      Duration(milliseconds: (2000 / 60).round());
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
          ],
        ),
      ),
    );
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.orangeColor.withOpacity(1),
      ),
      child: Center(
        child: Icon(
          icon,
          color: AppColors.textWhiteColor.withOpacity(0.8),
          size: 24,
        ),
      ),
    );
  }
}
