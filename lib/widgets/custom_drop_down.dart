import 'package:bowl_speed/imports_manager.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.list,
    required this.label,
  });

  final List<String>? list;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: GoogleFonts.rubik(
          color: AppColors.blueColor.withOpacity(0.9),
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        // labelText: 'Select an option',
        filled: true,
        fillColor: AppColors.orangeColor.withOpacity(0.1),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor1),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.primaryColor1, width: 1),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      value: list?[0],
      onChanged: (String? newValue) {
        if (label == Labels.bowlerType) {
          BowlerController.instance.setSelectedBowlerType(newValue!);
        } else {
          BowlerController.instance.setSelectedBowlerStyle(newValue!);
        }
      },
      items: list!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) => value == null ? 'Please select an option' : null,
    );
  }
}
