import 'package:bowl_speed/imports_manager.dart';

Future<void> customPitchSizeChangeDialog(
    TextEditingController controller, Function() onChange, Key key) async {
  await showGeneralDialog(
    context: Get.context!,
    barrierLabel: 'Label',
    transitionDuration: Duration(milliseconds: 300),
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
                  Labels.changePitchMeter,
                  style: GoogleFonts.rubik(fontSize: 16),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: key,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.blueColor,
                  cursorErrorColor: Colors.red,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blueColor.withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    label: Text(Labels.enterMeter),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 14),
                    hintStyle: GoogleFonts.rubik(
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueColor.withOpacity(0.6)),
                    filled: true,
                    fillColor: AppColors.orangeColor.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.greenColor, width: 0.5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: Validators.validatePitchSize,
                ),
              ),
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide.none,
            ),
            actions: [
              customElevatedButtonWithIcon(
                () => AppPages.back,
                Labels.cancel,
                Colors.white,
                AppColors.orangeColor,
                Icons.cancel,
              ),
              customElevatedButtonWithIcon(
                onChange,
                Labels.change,
                AppColors.orangeColor,
                Colors.white,
                Icons.check_circle_outline,
              ),
            ],
          ),
        ),
      );
    },
  );
}
