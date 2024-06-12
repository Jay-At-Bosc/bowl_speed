
import 'package:bowl_speed/imports_manager.dart';


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.privacyPolicy,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: permissionNames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPermissionHeading(permissionNames[index]),
                  const SizedBox(height: 6),
                  CustomPermissionDescription(
                      permissions[permissionNames[index]] ?? []),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget CustomPermissionHeading(String PermissionName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.lock,
          color: Colors.green,
        ),
        const SizedBox(width: 10),
        Text(
          PermissionName,
          style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // W
  Widget CustomPermissionDescription(List<String> permissionDescription) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: permissionDescription.map((description) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '- $description',
                  style: GoogleFonts.rubik(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

List<String> permissionNames = [
  "Privacy Policy",
  "Terms of Service",
  "Data Usage Policy"
];

List<String> permissionDescriptions1 = [
  "We ensure your personal data is safe.",
  "Use our services with respect to others.",
  "We collect data to improve our services."
];

List<String> permissionDescriptions2 = [
  "We do not share your data with third parties.",
  "You must comply with our rules and regulations.",
  "Your data helps us personalize your experience."
];

List<String> permissionDescriptions3 = [
  "You can request data deletion at any time.",
  "Violation of terms can lead to account suspension.",
  "We use data for analytics and research purposes."
];
Map<String, List<String>> permissions = {
  permissionNames[0]: permissionDescriptions1,
  permissionNames[1]: permissionDescriptions2,
  permissionNames[2]: permissionDescriptions3
};
