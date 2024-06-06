// ignore_for_file: unused_local_variable

import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';
import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:bowl_speed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../services/controllers/video_measure_controller.dart';
import 'calculation_section.dart';
import 'home_banner.dart';
import 'information_section.dart';
import 'menu_section_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

  
    return GetBuilder<VideoMeasureController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.textWhiteColor,
        body: CustomScrollView(
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
                ],
              ),
            ),
          ],
        ),
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
