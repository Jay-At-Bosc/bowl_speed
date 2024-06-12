import 'package:bowl_speed/imports_manager.dart';


class CustomRoundedIcon extends StatelessWidget {
  const CustomRoundedIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  // final TextStyle? style;
  final Color iconColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.orangeColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Flexible(
            child: CustomLabelText(
              label: label,
              style:
                  GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
