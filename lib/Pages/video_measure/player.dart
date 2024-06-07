import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:bowl_speed/services/controllers/video_measure_controller.dart';
import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/labels.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/quick_tap_controller.dart'; // Import for SystemChrome

class Player extends GetView<VideoMeasureController> {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    // Lock orientation to landscape for this screen only

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.landscapeLeft,
    //     DeviceOrientation.landscapeRight,
    //   ]);
    // });

    return Scaffold(
      backgroundColor: AppColors.textDarkColor,
      appBar: CustomAppBar(
        title: Labels.videoTitle,
        isHistoryBtnVisible: true,
        onHistory: QuickTapController.instance.getHistory,
      ),
      body: GetBuilder<VideoMeasureController>(builder: (context) {
        return Center(
          child: CustomVideoPlayer(
            customVideoPlayerController:
                VideoMeasureController.instance.customVideoPlayerController,
          ),
        );
      }),
    );
  }
}
