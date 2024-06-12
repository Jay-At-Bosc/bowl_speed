import 'package:bowl_speed/imports_manager.dart';

class CustomRadioButton extends GetWidget<SettingsController> {
  const CustomRadioButton(
      {super.key, required this.value, required this.label});
  final Sport value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      id: controller.gameTypeId,
      builder: (controller) {
        return Row(
          children: [
            Radio<Sport>(
              value: value,
              activeColor: AppColors.orangeColor,
              groupValue: controller.selectedSport,
              onChanged: (Sport? newValue) {
                if (newValue != null) {
                  controller.setSelectedSport(newValue);
                }
              },
            ),
            Text(
              label,
              style: GoogleFonts.rubik(),
            ),
          ],
        );
      },
    );
  }
}
