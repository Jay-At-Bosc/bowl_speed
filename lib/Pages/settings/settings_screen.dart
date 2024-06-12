import 'package:bowl_speed/imports_manager.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.settings,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// select Game
            Text(
              Labels.selectGameType,
              style:
                  GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),

            /// Two radio button options
            ListTile(
              contentPadding: EdgeInsets.zero,
              tileColor: AppColors.blueColor.withOpacity(0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomRadioButton(
                      value: Sport.cricket,
                      label: Labels.cricket,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomRadioButton(
                      value: Sport.baseBall,
                      label: Labels.baseBall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),

            /// pitch size set label
            Text(
              Labels.setDefaultPitchmeter,
              style:
                  GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4.0,
            ),

            /// pitch size set
            CustomTile(label: Labels.cricket, onTap: controller.onCricket),
            const SizedBox(
              height: 8.0,
            ),
            CustomTile(label: Labels.baseBall, onTap: controller.onBaseBall),
          ],
        ),
      ),
    );
  }
}
