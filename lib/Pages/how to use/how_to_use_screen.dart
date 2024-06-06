// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/labels.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.howToUse.capitalize!,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: Labels.steps.length,
            itemBuilder: (context, index) {
              if (index != 2) {
                return CustomNormalStepDescription(
                  index: index + 1,
                  description: Labels.steps[index],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${Labels.step} ${index + 1} :"),
                    SizedBox(
                      height: 4,
                    ),
                    customCardForDescription(description: Labels.steps[index]),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customButton(Labels.reachPoint),
                        customButton(Labels.reachPoint),
                      ],
                    ),
                    customCardForDescription(
                        description: Labels.descriptionThreeTwo),
                  ],
                );
              }
            }),
      ),
    );
  }

  Widget customButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellowColor.withOpacity(0.8),
        foregroundColor: AppColors.textDarkColor.withOpacity(0.6),
      ),
      child: Text(title),
    );
  }
}

class CustomNormalStepDescription extends StatelessWidget {
  const CustomNormalStepDescription(
      {super.key, required this.index, required this.description});

  final int index;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${Labels.step} $index :"),
        SizedBox(
          height: 4,
        ),
        customCardForDescription(description: description),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

Widget customCardForDescription({required String description}) {
  return Card(
    color: Color.fromARGB(255, 241, 252, 225),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        description,
        style: GoogleFonts.rubik(fontSize: 16, color: Colors.black),
      ),
    ),
  );
}
