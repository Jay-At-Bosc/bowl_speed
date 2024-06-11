
import 'package:bowl_speed/imports_manager.dart';


class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.label, this.onTap});

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.rubik(),
      ),
      tileColor: AppColors.blueColor.withOpacity(0.15),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onTap: onTap,
    );
  }
}
