import 'package:bowl_speed/imports_manager.dart';

class UnitConversionScreen extends GetView<UnitConversionController> {
  const UnitConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Labels.unitConversion,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UnitConversionController>(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Speed conversion
              CustomLabelText(
                label: Labels.convertDistance,
                style: GoogleFonts.rubik(
                  color: AppColors.blueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Input Dropdown
              CustomInputDropdown<DistanceUnits>(
                dropdownValue: controller.inputDistanceUnit,
                dropdownItems: DistanceUnits.values.toList(),
                dropdownonChanged: controller.updateInputDistanceUnit,
                formController: controller.distanceController,
                formOnChanged: controller.updateDistanceForm,
                validator: Validators.validatePitchSize,
                formKey: controller.distanceFormKey,
                focusNode: controller.distanceFocusNode,
              ),
              const SizedBox(
                height: 12,
              ),
              // Output Dropdown
              CustomOutputDropdown<DistanceUnits>(
                dropdownValue: controller.outputDistanceUnit,
                dropdownItems: DistanceUnits.values.toList(),
                result: formatDouble(controller.distanceResult),
                dropdownonChanged: controller.updateOutputDistanceUnit,
                
              ),
              const SizedBox(
                height: 20,
              ),

              /// Speed conversion
              CustomLabelText(
                label: Labels.convertSpeed,
                style: GoogleFonts.rubik(
                  color: AppColors.blueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // Input Dropdown
              CustomInputDropdown<SpeedUnits>(
                dropdownValue: controller.inputSpeedUnit,
                dropdownItems: SpeedUnits.values.toList(),
                dropdownonChanged: controller.updateInputSpeedUnit,
                formController: controller.speedController,
                formOnChanged: controller.updateSpeedForm,
                formKey: controller.speedFormKey,
                validator: Validators.validateSpeed,
                focusNode: controller.speedFocusNode,
              ),

              const SizedBox(
                height: 12,
              ),
              // Output Dropdown
              CustomOutputDropdown<SpeedUnits>(
                dropdownValue: controller.outputSpeedUnit,
                dropdownItems: SpeedUnits.values.toList(),
                result: formatDouble(controller.speedResult),
                dropdownonChanged: controller.updateOutputSpeedUnit,
              ),
            ],
          );
        }),
      ),
    );
  }
}
