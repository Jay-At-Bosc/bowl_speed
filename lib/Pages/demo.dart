import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    double dx = 100, dy = 100;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Gyroscope Demo",
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: StreamBuilder(
        stream: SensorsPlatform.instance.gyroscopeEventStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dx = dx + (snapshot.data!.x * 50);
            dy = dy + (snapshot.data!.y * 50);
          }
          return Transform.translate(
            offset: Offset(dx, dy),
            child: const CircleAvatar(
              foregroundColor: AppColors.blueColor,
              backgroundColor: AppColors.blueColor,
              radius: 20,
            ),
          );
        },
      ),
    );
  }
}
