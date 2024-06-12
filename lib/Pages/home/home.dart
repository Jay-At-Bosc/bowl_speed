// ignore_for_file: unused_import
import 'package:bowl_speed/imports_manager.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    update();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: AppColors.textWhiteColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: Get.height * 0.47,
              maxHeight: Get.height * 0.47,
              child: const HomeBanner(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // QuickTap & Video Tap section
                const MenuSectionCard(),

                // Information section
                const InformationSection(),

                // Calculation & Converters section
                const CalculationSection(),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
