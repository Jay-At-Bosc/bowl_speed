import 'dart:developer';

import 'package:bowl_speed/imports_manager.dart';

class BowlerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static BowlerController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  List<BowlerDetails> bowlerList = [];
  List<QuickTapModel> bowlerReport = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  List<String> bowlersType = [
    "Fast Bowling",
    "Spin Bowling",
  ];

  List<String> bowlersStyle = [
    "Right Arm",
    "Left Arm",
  ];

  String selectedBowlerType = "";
  String selectedBowlerStyle = "";
  int deleteIconIndex = -1;

  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    getAllBowlers();
    selectedBowlerType = bowlersType[0];
    selectedBowlerStyle = bowlersStyle[0];
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void toggleDeleteIcon(int index) {
    if (deleteIconIndex == index) {
      deleteIconIndex =
          -1; // Hide the delete icon if already showing for the same index
      animationController.reverse();
    } else {
      deleteIconIndex = index; // Show the delete icon for the selected index
      animationController.forward();
    }
    update(['bowler']);
  }

  void hideDeleteIcon() {
    deleteIconIndex = -1;
    animationController.reverse();
    update(['bowler']);
  }

  void setSelectedBowlerType(String value) {
    selectedBowlerType = value;
    log("type $selectedBowlerType");
  }

  void setSelectedBowlerStyle(String value) {
    selectedBowlerStyle = value;
    log("style $selectedBowlerStyle");
  }

  void getAllBowlers() async {
    bowlerList = await DatabaseHelper.instance.readAllBowlerDetail();
    update(['bowler']);
    // Get.to(() => const QuickTapHistoryScreen());
  }

  void deteletBowler(int index, String name) async {
    bool isDeleted = await DatabaseHelper.instance.deleteBowlerDetail(index);
    bool isRecordsDeleted =
        await DatabaseHelper.instance.deleteBowlerRecords(name);
    if (isDeleted && isRecordsDeleted) {
      log("deleted");
      getAllBowlers();
    }
    update(['bowler']);
    // Get.to(() => const QuickTapHistoryScreen());
  }
}
