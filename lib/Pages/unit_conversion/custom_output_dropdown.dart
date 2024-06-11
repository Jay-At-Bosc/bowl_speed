
import 'package:bowl_speed/imports_manager.dart';

class CustomOutputDropdown<T extends Unit>
    extends GetView<UnitConversionController> {
  const CustomOutputDropdown(
      {super.key,
      required this.dropdownValue,
      required this.dropdownItems,
      this.dropdownonChanged,
      required this.result});

  final String result;
  final T dropdownValue;
  final List<T> dropdownItems;
  final void Function(T?)? dropdownonChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                // color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.blueColor, width: 1),
              ),
              child: DropdownButton<T>(
                style: GoogleFonts.rubik(
                  color: AppColors.textDarkColor,
                  fontWeight: FontWeight.w400,
                ),
                value: dropdownValue,
                underline: const SizedBox(),
                items: dropdownItems.map((T unit) {
                  return DropdownMenuItem<T>(
                    value: unit,
                    child: Text(unit.getLabel),
                  );
                }).toList(),
                onChanged: dropdownonChanged,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            flex: 4,
            child: GetBuilder<UnitConversionController>(builder: (context) {
              return TextField(
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.rubik(
                      color: AppColors.textDarkColor.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  // borderRadius: BorderRadius.circular(10),
                  labelText: result,
                  enabled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.blueColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.blueColor),
                  ),
                ),
                readOnly: true,
              );
            }),
          ),
        ],
      ),
    );
  }
}
