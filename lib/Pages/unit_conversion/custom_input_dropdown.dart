import 'package:bowl_speed/imports_manager.dart';

class CustomInputDropdown<T extends Unit>
    extends GetView<UnitConversionController> {
  const CustomInputDropdown(
      {super.key,
      required this.formKey,
      required this.formController,
      required this.formOnChanged,
      required this.dropdownValue,
      required this.dropdownItems,
      required this.dropdownonChanged,
      required this.validator,
      required this.focusNode});

  final T dropdownValue;
  final List<T> dropdownItems;
  final GlobalKey<FormState> formKey;
  final TextEditingController formController;
  final void Function(String)? formOnChanged;
  final void Function(T?)? dropdownonChanged;
  final String? Function(String?)? validator;
  final FocusNode focusNode;

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
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(10),
                value: dropdownValue,
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
              child: Form(
                key: formKey,
                child: TextFormField(
                  focusNode: focusNode,
                  style: GoogleFonts.rubik(
                    color: AppColors.textDarkColor.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    errorMaxLines: 2,
                    errorStyle: GoogleFonts.rubik(
                      fontSize: 0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.blueColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.blueColor),
                    ),
                  ),
                  controller: formController,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: formOnChanged,
                  validator: validator,
                ),
              )),
        ],
      ),
    );
  }
}
