import 'package:bowl_speed/imports_manager.dart';


void customAnimatedDialogue(
    BuildContext context, String title, String content, Function() save) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Label',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
    transitionBuilder: (context, a1, a2, widget) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(a1),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(a1),
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.rubik(fontSize: 16),
                ),
              ],
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  maxLines: 2,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide.none,
            ),
            actions: [
              ElevatedButton.icon(
                onPressed: () => MenuFeatureController.instance.shareApp(""),
                label: Text(Labels.share),
                icon: const Icon(Icons.share),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textWhiteColor,
                  foregroundColor: AppColors.orangeColor,
                  iconColor: AppColors.orangeColor,
                  textStyle: GoogleFonts.rubik(fontSize: 16),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  save();
                  FocusScope.of(context).unfocus();
                },
                label: Text(Labels.save),
                icon: const Icon(Icons.save),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeColor,
                  foregroundColor: AppColors.textWhiteColor,
                  iconColor: AppColors.textWhiteColor,
                  textStyle: GoogleFonts.rubik(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).then((_) {
    FocusScope.of(context).unfocus();
  });
}
