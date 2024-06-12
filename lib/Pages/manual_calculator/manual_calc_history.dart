import 'package:bowl_speed/imports_manager.dart';

class ManualCalcHistory extends GetView<ManualCalculatorController> {
  const ManualCalcHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.history,
      ),
      body: controller.historyList.isEmpty
          ? Center(child: Text(Labels.historyNotFound))
          : ListView.builder(
              itemCount: controller.historyList.length,
              itemBuilder: (context, index) {
                var obj = controller.historyList[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.blueColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCustomCardRow(
                              "${Labels.pitchSize} :", obj.distance.toString()),
                          _buildDivider(),
                          _buildCustomCardRow(
                              "${Labels.timeOfTravel} :", obj.time.toString()),
                          _buildDivider(),
                          _buildCustomCardRow(
                              Labels.speedKmh, obj.kmh.toStringAsFixed(2)),
                          _buildDivider(),
                          _buildCustomCardRow(
                              Labels.speedMhp, obj.mph.toStringAsFixed(2)),
                          _buildDivider(),
                          _buildCustomCardRow("${Labels.measurementType} :",
                              obj.measurementType),
                          _buildDivider(),
                          _buildCustomCardRow("${Labels.date} :", obj.date),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
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
