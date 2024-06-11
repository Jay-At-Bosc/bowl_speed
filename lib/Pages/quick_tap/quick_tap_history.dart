
import 'package:bowl_speed/imports_manager.dart';

class QuickTapHistoryScreen extends GetView<QuickTapController> {
  const QuickTapHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Labels.history,
      ),
      body: controller.filterHistoryList.isEmpty
          ? Center(child: Text(Labels.historyNotFound))
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                CustomFilterDropDown(
                  controller: controller,
                  isHistory: true,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                GetBuilder<QuickTapController>(
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.filterHistoryList.length,
                      itemBuilder: (context, index) {
                        final history = controller.filterHistoryList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.containerColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildHeader(history.bowler),
                                  const SizedBox(height: 16.0),
                                  _buildCustomCardRow("${Labels.pitchSize} :",
                                      history.distance.toString()),
                                  _buildDivider(),
                                  _buildCustomCardRow(
                                      "${Labels.timeOfTravel} :", history.time),
                                  _buildDivider(),
                                  _buildCustomCardRow(Labels.speedKmh,
                                      history.kmh.toStringAsFixed(2)),
                                  _buildDivider(),
                                  _buildCustomCardRow(Labels.speedMhp,
                                      history.mps.toStringAsFixed(2)),
                                  _buildDivider(),
                                  _buildCustomCardRow(
                                      "${Labels.measurementType} :",
                                      history.measurementType),
                                  _buildDivider(),
                                  _buildCustomCardRow(
                                      "${Labels.date} :", history.date),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
    );
  }

  Widget _buildHeader(String bowler) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomLabelText(
          label: bowler,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        CustomLabelText(
          label: Labels.cricket,
          style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildCustomCardRow(String label, String value) {
    return CustomCardRow(
      label: label,
      value: value,
    );
  }

  Widget _buildDivider() {
    return const Divider();
  }
}
