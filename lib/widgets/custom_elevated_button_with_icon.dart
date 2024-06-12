import 'package:bowl_speed/imports_manager.dart';


Widget customElevatedButtonWithIcon(Function() onTap, String label,
    Color bgColor, Color fgColor, IconData icon) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      // iconColor: fgColor,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.rubik(fontSize: 16),
        ),
      ],
    ),
  );
}
