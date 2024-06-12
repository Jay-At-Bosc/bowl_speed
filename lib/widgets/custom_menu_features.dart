import 'package:bowl_speed/imports_manager.dart';


class CustomMenuFeatures extends GetView<MenuFeatureController> {
  const CustomMenuFeatures({
    super.key,
    this.message,
    required this.isHome,
  });
  final String? message;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      iconColor: isHome ? AppColors.orangeColor : AppColors.textWhiteColor,
      onSelected: (String result) {
        switch (result) {
          case 'Rate Us':
            controller.rateUs();
            break;
          case 'Share App':
            controller.shareApp(message);
            break;
          case 'Privacy Policy':
            controller.openPrivacyPolicy();
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Rate Us',
          child: Text('Rate Us'),
        ),
        const PopupMenuItem<String>(
          value: 'Share App',
          child: Text('Share App'),
        ),
        const PopupMenuItem<String>(
          value: 'Privacy Policy',
          child: Text('Privacy Policy'),
        ),
      ],
    );
  }
}
