
import 'package:bowl_speed/imports_manager.dart';


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
