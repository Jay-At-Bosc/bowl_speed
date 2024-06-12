import 'package:bowl_speed/imports_manager.dart';

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
            icon: const Icon(
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
                  const Icon(Icons.share),
                  const SizedBox(width: 4),
                  Text(
                    Labels.save,
                    style: GoogleFonts.rubik(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Spacer(),
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
                  const Icon(Icons.check_circle_outlined),
                  const SizedBox(width: 4),
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
    transitionDuration: const Duration(milliseconds: 500),
    transitionCurve: Curves.easeInOut,
    //     transition: CustomBounceTransition(),
  );
}
